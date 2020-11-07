class VMsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]

    def create
        @vm = current_user.vm.build(vm_params)
        if @vm.save
            flash[:success] = "Virtual Machine created!"
            redirect_to current_user
        else
            render 'vm/new'
    end

    def destroy
    end

    private

    def vm_params
        params.require(:vm).permit(:type, :vm_name)
    end
end
