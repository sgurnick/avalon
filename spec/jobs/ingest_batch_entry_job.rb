# Copyright 2011-2017, The Trustees of Indiana University and Northwestern
#   University.  Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software distributed
#   under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
#   CONDITIONS OF ANY KIND, either express or implied. See the License for the
#   specific language governing permissions and limitations under the License.
# ---  END LICENSE_HEADER BLOCK  ---

require 'rails_helper'

describe IngestBatchEntryJob do
  let(:batch_entry) { FactoryGirl.create(:batch_entries) }
  let!(:collection) { FactoryGirl.create(:collection, id: 'zc77sq08x') }

  describe "perform" do
    it 'runs' do
      expect { described_class.perform_now(batch_entry) }.to change { MediaObject.count }.by(1)
    end
  end
end