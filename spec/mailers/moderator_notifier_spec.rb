require "spec_helper"

describe ModeratorNotifier do
  describe 'exhibition notifier' do
    let!(:exhibition) { FactoryGirl.create(:exhibition) }
    let!(:user) { FactoryGirl.create(:user) }

    context 'when new exhibition is created' do
      before :each do
        user.exhibitions << exhibition
        @email = ModeratorNotifier.notify_moderator(exhibition, 'create')
      end
      it 'deliveres email to exhibitions user email' do
        expect(@email).to deliver_to(exhibition.user.email)
      end
      it 'contains info about exhibition name' do
        expect(@email).to have_body_text(exhibition.name)
      end
      it 'contains info about exhibition address' do
        expect(@email).to have_body_text(exhibition.adress)
      end
      it 'has correct subject' do
        expect(@email).to have_subject('Moderator notifications.')
      end
      it 'has link to exhibition' do
        expect(@email).to have_body_text(/#{exhibition_url(exhibition)}/)
      end
      it 'hast link to all exhibits' do
        expect(@email).to have_body_text(/#{exhibits_url}/)
      end
    end

    context 'when exhibition is updated' do
      before :each do
        user.exhibitions << exhibition
        @email = ModeratorNotifier.notify_moderator(exhibition, 'update')
      end
      it 'deliveres email to exhibitions user email' do
        expect(@email).to deliver_to(exhibition.user.email)
      end
      it 'contains info about exhibition name' do
        expect(@email).to have_body_text(exhibition.name)
      end
      it 'has correct subject' do
        expect(@email).to have_subject('Moderator notifications.')
      end
      it 'has link to exhibition' do
        expect(@email).to have_body_text(/#{exhibition_url(exhibition)}/)
      end
    end

    context 'when exhibition is deleted' do
      before :each do
        user.exhibitions << exhibition
        @email = ModeratorNotifier.notify_moderator(exhibition, 'destroy')
      end

      it 'deliveres email to exhibitions user email' do
        expect(@email).to deliver_to(exhibition.user.email)
      end
      it 'contains info about exhibition name' do
        expect(@email).to have_body_text(exhibition.name)
      end
      it 'has correct header' do
        expect(@email).to have_body_text(/Exhibition deleted!/)
      end
      it 'has correct subject' do
        expect(@email).to have_subject('Moderator notifications.')
      end
    end
  end

  describe 'exhibit notifier' do
    let!(:exhibit) { FactoryGirl.create(:exhibit) }
    let!(:user) { FactoryGirl.create(:user) }

    context 'when new exhibit is created' do
      before :each do
        user.exhibits << exhibit
        @email = ModeratorNotifier.notify_moderator(exhibit, 'create')
      end
      it 'deliveres email to exhibits user email' do
        expect(@email).to deliver_to(exhibit.user.email)
      end
      it 'contains info about exhibits name' do
        expect(@email).to have_body_text(exhibit.name)
      end
      it 'contains info about exhibits registration number' do
        expect(@email).to have_body_text(exhibit.registration_number)
      end
      it 'has correct subject' do
        expect(@email).to have_subject('Moderator notifications.')
      end
      it 'has link to exhibit' do
        expect(@email).to have_body_text(/#{exhibit_url(exhibit)}/)
      end
      it 'hast link to all exhibitions' do
        expect(@email).to have_body_text(/#{exhibitions_url}/)
      end
    end

    context 'when exhibit is updated' do
      before :each do
        user.exhibits << exhibit
        @email = ModeratorNotifier.notify_moderator(exhibit, 'update')
      end
      it 'deliveres email to exhibits user email' do
        expect(@email).to deliver_to(exhibit.user.email)
      end
      it 'contains info about exhibition name' do
        expect(@email).to have_body_text(exhibit.name)
      end
      it 'has correct subject' do
        expect(@email).to have_subject('Moderator notifications.')
      end
      it 'has link to exhibit' do
        expect(@email).to have_body_text(/#{exhibit_url(exhibit)}/)
      end
    end

    context 'when exhibition is deleted' do
      before :each do
        user.exhibits << exhibit
        @email = ModeratorNotifier.notify_moderator(exhibit, 'destroy')
      end

      it 'deliveres email to exhibits user email' do
        expect(@email).to deliver_to(exhibit.user.email)
      end
      it 'contains info about exhibits name' do
        expect(@email).to have_body_text(exhibit.name)
      end
      it 'has correct header' do
        expect(@email).to have_body_text(/Exhibit deleted!/)
      end
      it 'has correct subject' do
        expect(@email).to have_subject('Moderator notifications.')
      end
    end
  end
end
