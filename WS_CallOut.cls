// 3. Make a basic http callout and print the result using system.debug
public class WS_CallOut {
    public static void fetchDetails(){
        try{
            string endpoint = 'https://postman-echo.com/get?foo1=bar1&foo2=bar2';
            Http httpservice = new Http();
            HttpRequest request = new HttpRequest();
            request.setMethod('GET');
            request.setEndpoint(endpoint);
            request.setHeader('Content-Type','application/json');
            HttpResponse response = httpservice.send(request);
            System.debug(response.getBody());
        } catch (Exception ex){
            System.debug('Error Line::'+ex.getLineNumber()+'Message::'+ex.getMessage());
        }
        
	}
}