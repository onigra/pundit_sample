class Role < ActiveRecord::Base
  has_one :user
  has_many :roles_abilities, :dependent => :destroy
  has_many :abilities, through: :roles_abilities
  accepts_nested_attributes_for :roles_abilities, :update_only => true

  def ability(h = {})
    roles_abilities.group_by {|i| i.ability.domain }.each do |key, vals|
      h[key] = vals.map {|val| { val.ability.ability => val.ability.id } }
    end

    return h
  end

  def ability_id_to_a
    roles_abilities.map { |i| i.ability_id }
  end

  def index_by_ability_id
    roles_abilities.index_by(&:ability_id)
  end

  ###
  # roleに紐づくability_idを更新する際、
  #   * 不要になるroles_abilities.ability_idが存在したら物理削除
  #   * 新しく作成するものは新規作成
  #   * 既にあるものは何もしない
  #
  def destroy_and_update(params)
    begin
      ActiveRecord::Base.transaction do
        destroy_old_abilities(params) if params_has_ability_id?(params)
        raise ActiveRecord::Rollback unless update(push_current_roles_abilities_id { params })
        reload
        true
      end
    rescue => e
      logger.error e.message
      e.backtrace.each { |line| logger.error line }
      false
    end
  end

  ###
  # paramsのability_idに現在のability_idが入っていた場合、
  # hashにroles_abilities.idを追加する
  #
  # 更新時のリクエストパラメータもability_idのみだが、
  # 既に存在するability_idが入ってるレコードには何もしたくない。
  # そのため、updateを呼ぶ際にroles_abilities.idを追加する。
  #
  def push_current_roles_abilities_id
    if yield.include?("roles_abilities_attributes")
      yield["roles_abilities_attributes"].each do |item|
        item["id"] = index_by_ability_id[item["ability_id"].to_i].id.to_s if index_by_ability_id.include?(item["ability_id"].to_i)
      end
    end

    yield
  end

  ###
  # 削除するability_idがインスタンスのroles_abilities.ability_idと
  # 一致していたら物理削除
  #
  def destroy_old_abilities(params)
    destroy_id = get_destroy_id(params)

    unless destroy_id.blank?
      RolesAbility.where(role_id: id).where(ability_id: destroy_id).delete_all
    end
  end

  ###
  # role更新時に削除するability_idを取得して配列で返す
  #
  # privateメソッドでもいいような気がするが、
  # 正しく削除するidを取得してるかテストしたかった
  #
  def get_destroy_id(params)
    ability_id_to_a - params_to_array(params)
  end

  private

    ###
    # パラメータで渡されたability_idを配列で返す
    #
    def params_to_array(params)
      params["roles_abilities_attributes"].map{ |item| item["ability_id"].to_i }
    end

    ###
    # パラメータにroles_abilities_attributesがあるかチェック
    # roles_abilities_attributesに空配列とかはいってきたら困るため
    #
    def params_has_ability_id?(params)
      params.include?("roles_abilities_attributes") && params["roles_abilities_attributes"].present?
    end
end
