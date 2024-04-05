package package_491
{
   import base.class_122;
   import forms.name_1838;
   
   public class class_219 extends class_122
   {
       
      
      private var var_1169:name_1838;
      
      public function class_219(param1:int, param2:int)
      {
         super();
         this.var_1169 = new name_1838();
         this.var_1169.width = param1;
         this.var_1169.height = param2;
         addChild(this.var_1169);
      }
      
      public function get window() : name_1838
      {
         return this.var_1169;
      }
   }
}
