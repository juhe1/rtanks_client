package package_491
{
   import base.class_122;
   import forms.TankWindowWithHeader;
   
   public class class_219 extends class_122
   {
       
      
      private var var_1169:TankWindowWithHeader;
      
      public function class_219(param1:int, param2:int)
      {
         super();
         this.var_1169 = new TankWindowWithHeader();
         this.var_1169.width = param1;
         this.var_1169.height = param2;
         addChild(this.var_1169);
      }
      
      public function get window() : TankWindowWithHeader
      {
         return this.var_1169;
      }
   }
}
