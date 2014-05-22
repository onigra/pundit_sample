shared_context "管理者でログイン" do
  let(:user) { FG.create(:administrator) }
  before { sign_in :user, user }
end

shared_context "User権限保持者でログイン" do
  let(:user) { FG.create(:has_user_authority) }
  before { sign_in :user, user }
end

shared_context "Role権限保持者でログイン" do
  let(:user) { FG.create(:has_role_authority) }
  before { sign_in :user, user }
end

shared_context "管理者" do
  let(:user) { FG.create(:administrator) }
end

shared_context "User" do
  let(:user) { FG.create(:has_user_authority) }
end

shared_context "Role" do
  let(:user) { FG.create(:has_role_authority) }
end
