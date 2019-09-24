public class ShowAccListCtrl {
	
    @auraEnabled
    public static List<Account> getAccount(){
        return [Select Id,Name,Phone,CreatedDate from Account order by CreatedDate Desc Limit 10];
    }
}