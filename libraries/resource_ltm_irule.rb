#
# Author:: Sergio Rua <sergio@rua.me.uk>

# Cookbook Name:: f5-bigip
# Resource:: ltm_irule
#
# Copyright:: 2015, Sky Betting and Gaming
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

class Chef
  class Resource
    #
    # Chef Resource for F5 LTM iRule
    #
    class F5LtmIrule < Chef::Resource
      def initialize(name, run_context = nil)
        super
        @resource_name = :f5_ltm_irule
        @provider = Chef::Provider::F5LtmIrule
        @action = :create
        @allowed_actions = [:create, :delete]

        # This is equivalent to setting :name_attribute => true
        @irule_name = name
        @template = nil
        @content = nil
        @variables = {}
      end

      def irule_name(arg = nil)
        set_or_return(:irule_name, arg, :kind_of => String, :required => true)
      end

      def template(arg = nil)
        set_or_return(:template, arg, :kind_of => String, :required => false)
      end

      def content(arg = nil)
        set_or_return(:content, arg, :kind_of => String, :required => false)
      end

      def variables(arg = nil)
        set_or_return(:variables, arg, :kind_of => [Array, Hash], :required => false)
      end

      def f5(arg = nil)
        set_or_return(:f5, arg, :kind_of => String, :required => true)
      end

      attr_accessor :exists, :update, :irule
    end
  end
end
