require 'test_helper'
require 'devise/test_helpers'

class WorkControllerTest < ActionController::TestCase
  test "should login and change arm count" do
    assert_difference 'AutoWorkSpace.count', 1 do
      app_id='1'
      os='win'
      user='sanya'
      cpu_name='cpu2'
      get :app_login, {:app_id => app_id, :name=> cpu_name,:os=>os,:os_user=> user,  :format => 'json'}
      assert response.status ==201
      assert JSON.parse(response.body)['uuid']==app_id
      assert JSON.parse(response.body)['computername']==cpu_name
      assert JSON.parse(response.body)['os']==os
      assert JSON.parse(response.body)['os_user']==user
    end


  end

  test "should not change arm count return old" do
    assert_difference 'AutoWorkSpace.count', 0 do
      app_id=auto_work_spaces(:one).uuid
      os=auto_work_spaces(:one).os
      user=auto_work_spaces(:one).os_user
      cpu_name=auto_work_spaces(:one).computername
      get :app_login, {:app_id => app_id, :name=> cpu_name+'1',:os=>os+'x',:os_user=> user+'zzz',  :format => 'json'}
      assert response.status ==201
      #should return old values
      assert JSON.parse(response.body)['uuid']==app_id
      assert JSON.parse(response.body)['computername']==cpu_name
      assert JSON.parse(response.body)['os']==os
      assert JSON.parse(response.body)['os_user']==user
    end
  end

  test "should get app_logout" do
    #get :app_logout
   # assert_response :success
  end

end
