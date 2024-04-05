package controls.dropdownlist
{
   import flash.display.BitmapData;
   
   public class AccountsBackground extends DPLBackground
   {
      
      private static const const_2099:Class = name_3730;
       
      
      public function AccountsBackground()
      {
         super(100,275);
      }
      
      override protected function get bgBMP() : BitmapData
      {
         if(!var_2686)
         {
            var_2686 = new const_2099().bitmapData;
         }
         return var_2686;
      }
   }
}
