# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  let(:user) { create(:user) }
  let(:project) { create(:project, user:) }

  before do
    allow(controller).to receive(:current_user).and_return(user)
  end

  describe 'GET #new' do
    it 'renders the new template' do
      get :new

      expect(response).to render_template(:new)
    end
  end

  describe 'POST' do
    context 'with valid parameters' do
      it 'creates a new project' do
        project_params = {
          name: 'Almanac project',
          description: 'Project to return in the time',
          project_type: 'personal',
          user_id: user.id
        }

        post :create, params: { project: project_params }

        project = Project.last

        expect(response).to redirect_to(project_path(project))
        expect(Project.count).to eq(1)
        expect(flash[:notice]).to eq('Proyecto creado con exito')
      end
    end

    context 'with invalid parameters' do
      it 'does not create a project' do
        project_params = {
          name: nil,
          description: 'Project to return in the time',
          project_type: 'personal',
          user_id: user.id
        }

        post :create, params: { project: project_params }

        expect(Project.count).to eq(0)
      end
    end
  end

  describe 'GET #show' do
    it 'renders the show template' do
      get :show, params: { id: project.id }

      expect(response).to render_template(:show)
    end
  end

  describe 'GET #edit' do
    it 'renders the edit template' do
      get :edit, params: { id: project.id }

      expect(response).to render_template(:edit)
    end
  end

  describe 'PATCH #update' do
    context 'with valid parameters' do
      it 'updates the project' do
        project_params = {
          name: 'fire',
          description: 'change description',
          project_type: 'personal',
          user_id: user.id
        }

        patch :update, params: { id: project.id, project: project_params }

        expect(Project.count).to eq(1)
        expect(project.reload.name).to eq('fire')
        expect(flash[:notice]).to eq('Proyecto actualizado correctamente')
      end
    end

    context 'with invalid parameters' do
      it 'does not update the project' do
        project_params = {
          name: nil,
          description: 'change description',
          project_type: 'personal',
          user_id: user.id
        }

        patch :update, params: { id: project.id, project: project_params }

        expect(Project.count).to eq(1)
        expect(project.reload.name).to eq('Almanaque')
        expect(flash[:notice]).not_to eq('Proyecto actualizado correctamente')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the project' do
      delete :destroy, params: { id: project.id }

      expect(Project.count).to eq(0)
    end
  end
end
