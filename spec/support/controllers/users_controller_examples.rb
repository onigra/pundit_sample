#
# index
#
shared_examples "User indexができる" do
  before { get :index }
  subject { assigns(:users) }

  it { should include user }
  it_behaves_like 'http code', 200
end

shared_examples "User indexができない" do
  before { get :index }

  it_behaves_like 'http code', 404
end

#
# show 
#
shared_examples "User showができる" do
  before { get :show, id: user.to_param }
  subject { assigns(:user) }

  it { should eq user }
  it_behaves_like 'http code', 200
end

shared_examples "User showができない" do
  before { get :show, id: user.to_param }

  it_behaves_like 'http code', 404
end

#
# new
#
shared_examples "User newができる" do
  before { get :new }
  subject { assigns(:user) }

  it { should be_a_new(User) }
  it_behaves_like 'http code', 200
end

shared_examples "User newができない" do
  before { get :new }

  it_behaves_like 'http code', 404
end

#
# edit
#
shared_examples "User editができる" do
  before { get :edit, id: user.to_param }
  subject { assigns(:user) }

  it { should eq user }
  it_behaves_like 'http code', 200
end

shared_examples "User editができない" do
  before { get :edit, id: user.to_param }

  it_behaves_like 'http code', 404
end

#
# create
#
shared_examples "User createができる" do
  context "with valid params" do
    before { post :create, { :user => valid_attributes } }

    it_behaves_like 'http code', 302

    context "creates a new User" do
      subject { User.count }

      it { should eq 3 }
    end

    context "assigns a newly created user as @user" do
      subject { assigns(:user) }

      it { should be_a(User) }
      it { should be_persisted }
    end

    context "redirects to the created user" do
      subject { response }

      it { should redirect_to(User.last) }
    end
  end

  context "with invalid params" do
    before do
      User.any_instance.stub(:save).and_return(false)
      post :create, { :user => { "name" => "invalid value" } }
    end

    it_behaves_like 'http code', 200

    context "assigns a newly created but unsaved user as @user" do
      subject { assigns(:user) }

      it { should be_a_new(User) }
    end

    context "re-renders the 'new' template" do
      subject { response }

      it { should render_template("new") }
    end
  end
end

shared_examples "User createができない" do
  before { post :create, { :user => valid_attributes } }

  it_behaves_like 'http code', 404
end

#
# update
#
shared_examples "User updateができる" do
  context "with valid params" do
    before do
      put :update, { :id => user.to_param, :user => update_attributes }
      user.reload
    end

    it_behaves_like 'http code', 302

    context "updates the requested user" do
      subject { user.name }

      it { should eq update_attributes["name"] }
    end

    context "assigns the requested user as @user" do
      subject { assigns(:user) }

      it { should eq user }
    end

    context "redirects to the user" do
      subject { response }

      it { should redirect_to user }
    end
  end

  context "with invalid params" do
    before do
      User.any_instance.stub(:save).and_return(false)
      put :update, { :id => user.to_param, :user => { "name" => "invalid value" } }
    end

    it_behaves_like 'http code', 200

    context "assigns the user as @user" do
      subject { assigns(:user) }

      it { should eq user }
    end

    context "re-renders the 'edit' template" do
      subject { response }

      it { should render_template("edit") }
    end
  end
end

shared_examples "User updateができない" do
  before { put :update, { :id => user.to_param, :user => update_attributes } }

  it_behaves_like 'http code', 404
end

#
# destroy
#
shared_examples "User destroyができる" do
  before { delete :destroy, { id: has_only_view_authority.to_param } }

  context "destroys the requested user" do
    subject { User.count }

    it { should eq 1 }
  end

  context "redirects to the users list" do
    subject { response }

    it { should redirect_to users_url }
  end
end

shared_examples "User destroyができない" do
  before { delete :destroy, { id: has_only_view_authority.to_param } }

  it_behaves_like 'http code', 404
end
