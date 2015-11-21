require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  login_user
  # This should return the minimal set of attributes required to create a valid
  # List. As you add validations to List, be sure to
  # adjust the attributes here as well.
  let(:valid_list) do
    FactoryGirl.create(:list, user: @user)
  end

  let(:valid_attributes) do
    FactoryGirl.attributes_for(:task, list: valid_list)
  end

  let(:invalid_attributes) do
    FactoryGirl.attributes_for(:task, list: valid_list, name: nil)
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ListsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new task' do
        expect do
          post :create, { format: :js, list_id: valid_list, task: valid_attributes }, valid_session
        end.to change(Task, :count).by(1)
      end

      it 'assigns a newly created task as @task' do
        post :create, { format: :js, list_id: valid_list, task: valid_attributes }, valid_session
        expect(assigns(:task)).to be_a(Task)
        expect(assigns(:task)).to be_persisted
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved list as @list' do
        post :create, { format: :js, list_id: valid_list, task: invalid_attributes }, valid_session
        expect(assigns(:task)).to be_a_new(Task)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested task' do
      task = Task.create! valid_attributes
      expect do
        delete :destroy, { format: :js, list_id: task.list_id, id: task.to_param }, valid_session
      end.to change(Task, :count).by(-1)
    end
  end

  describe 'POST #status' do
    it 'changes the requested task status' do
      task = Task.create! valid_attributes
      post :status, { format: :json, list_id: task.list_id, id: task.to_param, status: true }, valid_session
      task.reload
      expect(task.status).to eq(true)
    end
  end
end
