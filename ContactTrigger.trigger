//1. Create a field on Account named "Number of Contacts". Populate this field with the number of contacts related to an account.
trigger ContactTrigger on Contact (after insert,after update,after delete,after undelete) {
	//System.debug('ContactTrigger');

	if (Trigger.isAfter && (Trigger.isInsert || Trigger.isDelete || Trigger.isUndelete)) {
		//System.debug('Trigger.new::'+Trigger.new);
		//System.debug('Trigger.old::'+Trigger.old);
		List<Contact> TriggerContacts = new List<Contact>();
		if (Trigger.isDelete)
			TriggerContacts.addall(Trigger.old);
		else 
			TriggerContacts.addall(Trigger.new);

		set<id> idSet = new set<Id>();
		for(Contact con:TriggerContacts){
			idSet.add(con.AccountId);
		}
		List<Account> accList = [Select Id,(Select id from Contacts) from Account where Id=:idSet];
		//System.debug('accList::'+accList);

		List<Account> accToUpdate = new List<Account>();
		for(Account eachRec:accList) {
			Account acc = new Account();
			acc.Number_of_Contacts__c = eachRec.Contacts.size();
			acc.Id = eachRec.Id;
			accToUpdate.add(acc);
		}

		if (accToUpdate.size() > 0) {
			update accToUpdate;
			//System.debug('accToUpdate::'+accToUpdate);
		}
	}
}