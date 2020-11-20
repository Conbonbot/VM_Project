class VmsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]

    def new
        @vm = Vm.new
    end

    def create
        @vm = current_user.vms.build(vm_params)
        @vm.update_attribute(:username, current_user.username)
        debugger
        if @vm.save
            flash[:success] = "Virtual Machine created!"
            redirect_to current_user
        else
            render 'vm/new'
        end
    end

    def destroy
    end

    private

    def vm_params
        params.require(:vm).permit(:vm_type, :vm_name)
    end
end
