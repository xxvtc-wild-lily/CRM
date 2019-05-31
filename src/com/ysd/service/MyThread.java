package com.ysd.service;



import com.ysd.controller.WebSocketServlet;

public class MyThread implements Runnable {
	private Integer sum;
    private Integer new_sum;
    private boolean stopMe = true; 
    EmployeeServiceImp employeeService=new EmployeeServiceImp();
    
	
    public void stopMe() {  
        stopMe = false;  
    }  

    /* (non-Javadoc)
     * @see java.lang.Runnable#run()
     */
    public void run()  {
    	sum=employeeService.selectEmployeeroleCount();
    	String sumss="改";
        WebSocketServlet wbs=new WebSocketServlet();
        while(true){
        	new_sum=employeeService.selectEmployeeroleCount();
            if(sum!=new_sum){
                sum=new_sum;
                wbs.onMessage(sumss);
            }
            try {
                Thread.sleep(2000);
            } catch (InterruptedException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
    }
}
