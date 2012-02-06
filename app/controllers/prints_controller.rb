class PrintsController < ApplicationController
  
  
   
  def index
    
      respond_to do |format|
      format.html
      format.pdf do
        output = PrintReport.new.to_pdf
        send_data output, :filename => "hello.pdf", 
                          :type => "application/pdf",
                          :disposition=> "inline"
      end
    end  
    
  
   
  end

end
