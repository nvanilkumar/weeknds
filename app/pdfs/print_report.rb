class PrintReport < Prawn::Document
  def to_pdf
    text "Hello world Mak",:size =>30, :style => :bold
   render
  end
end