 class School < ApplicationRecord

    has_many :users, inverse_of: :school, dependent: :destroy 
    after_create :create_tenant

    #before_delete :drop_tenant

    private 

    def create_tenant
        Apartment::Tenant.create(subdomain)
    end

    #def drop_tenant
    #    Apartment::Tenant.drop(subdomain)
    #end
end