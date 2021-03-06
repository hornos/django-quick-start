#
# Cookbook Name:: rabbitmq
# Provider:: plugin
#
# Copyright 2012, Opscode, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

action :enable do
  unless system("rabbitmq-plugins list #{new_resource.plugin} | grep '\\[[Ee]\\] #{new_resource.plugin}'")
    execute "rabbitmq-plugins enable #{new_resource.plugin}" do
      Chef::Log.info "Enabling RabbitMQ plugin '#{new_resource.plugin}'."
      new_resource.updated_by_last_action(true)
    end
  end
end

action :disable do
  if system("rabbitmq-plugins list #{new_resource.plugin} | grep '\\[[Ee]\\] #{new_resource.plugin}'")
    execute "rabbitmq-plugins disable #{new_resource.plugin}" do
      Chef::Log.info "Disabling RabbitMQ plugin '#{new_resource.plugin}'."
      new_resource.updated_by_last_action(true)
    end
  end
end

