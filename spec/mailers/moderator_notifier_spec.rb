require "spec_helper"

describe ModeratorNotifier do

  shared_examples_for 'any entry notifier' do
    let!(:user) { FactoryGirl.create(:user) }

    it 'deliveres email to entry user email' do
      entry.stub(:user).and_return(user)
      expect(@email).to deliver_to(entry.user.email)
    end
    it 'contains info about entry name' do
      expect(@email).to have_body_text(entry.name)
    end
    it 'has correct subject' do
      expect(@email).to have_subject('Moderator notifications.')
    end
  end

  describe 'exhibition notifier' do
    let!(:exhibition) { FactoryGirl.create(:exhibition) }
    let!(:user) { FactoryGirl.create(:user) }
    before :each do
      exhibition.stub(:user).and_return(user)
    end

    context 'when new exhibition is created' do
      before :each do
        @email = ModeratorNotifier.notify_moderator(exhibition, 'create')
      end

      it_behaves_like 'any entry notifier' do
        let(:entry) { FactoryGirl.create(:exhibition) }
      end

      it 'contains info about exhibition address' do
        expect(@email).to have_body_text(exhibition.adress)
      end
      it 'has link to exhibition' do
        expect(@email).to have_body_text(/#{admin_exhibition_url(exhibition)}/)
      end
      it 'hast link to all exhibits' do
        expect(@email).to have_body_text(/#{admin_exhibits_url}/)
      end

    end

    context 'when exhibition is updated' do
      before :each do
        @email = ModeratorNotifier.notify_moderator(exhibition, 'update')
      end

      it_behaves_like 'any entry notifier' do
        let(:entry) { FactoryGirl.create(:exhibition) }
      end

      it 'has link to exhibition' do
        expect(@email).to have_body_text(/#{admin_exhibition_url(exhibition)}/)
      end
    end

    context 'when exhibition is deleted' do
      before :each do
        @email = ModeratorNotifier.notify_moderator(exhibition, 'destroy')
      end

      it_behaves_like 'any entry notifier' do
        let(:entry) { FactoryGirl.create(:exhibition) }
      end
    end
  end

  describe 'exhibit notifier' do
    let!(:exhibit) { FactoryGirl.create(:exhibit) }
    let!(:user) { FactoryGirl.create(:user) }

    before :each do
      exhibit.stub(:user).and_return(user)
    end

    context 'when new exhibit is created' do
      before :each do
        @email = ModeratorNotifier.notify_moderator(exhibit, 'create')
      end

      it_behaves_like 'any entry notifier' do
        let(:entry) { FactoryGirl.create(:exhibit) }
      end

      it 'contains info about exhibits registration number' do
        expect(@email).to have_body_text(exhibit.registration_number)
      end
      it 'has link to exhibit' do
        expect(@email).to have_body_text(/#{admin_exhibit_url(exhibit)}/)
      end
      it 'hast link to all exhibitions' do
        expect(@email).to have_body_text(/#{admin_exhibitions_url}/)
      end
    end

    context 'when exhibit is updated' do
      before :each do
        @email = ModeratorNotifier.notify_moderator(exhibit, 'update')
      end

      it_behaves_like 'any entry notifier' do
        let(:entry) { FactoryGirl.create(:exhibit) }
      end

      it 'has link to exhibit' do
        expect(@email).to have_body_text(/#{admin_exhibit_url(exhibit)}/)
      end
    end

    context 'when exhibition is deleted' do
      before :each do
        @email = ModeratorNotifier.notify_moderator(exhibit, 'destroy')
      end

      it_behaves_like 'any entry notifier' do
        let(:entry) { FactoryGirl.create(:exhibit) }
      end
    end
  end
end
