ActiveAdmin.register Advice do

batch_action "sss" do |ids|
	Advice.find(ids).each do |post|
  		post.update_attributes(live: true)
	end
	redirect_to collection_path, alert: "Advice made live."
end

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :body, :live, :twitter_handle
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end


end
