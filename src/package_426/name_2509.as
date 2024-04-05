package package_426
{
   import controls.dropdownlist.DropDownList;
   import flash.events.MouseEvent;
   import package_425.class_200;
   
   public class name_2509 extends DropDownList implements class_200
   {
       
      
      private var var_1970:Boolean;
      
      private var category:String;
      
      public function name_2509(param1:String)
      {
         super();
         this.category = param1;
         height = 256;
      }
      
      override protected function method_1582(param1:MouseEvent) : void
      {
         if(this.var_1970)
         {
            dispatchEvent(new MouseEvent(MouseEvent.CLICK));
         }
         else
         {
            super.method_1582(param1);
         }
      }
      
      public function getCategory() : String
      {
         return this.category;
      }
      
      public function get enabled() : Boolean
      {
         return this.var_1970;
      }
      
      public function set enabled(param1:Boolean) : void
      {
         this.var_1970 = param1;
      }
   }
}
