package package_491
{
   import controls.name_1891;
   
   public class name_3686 extends class_219
   {
      
      private static const name_2602:int = 12;
       
      
      private var var_3756:int;
      
      public var var_1182:name_1891;
      
      public function name_3686(param1:int, param2:int, param3:int)
      {
         super(param1 + 12 * 2,param2 + param3 + 12 * 3);
         this.var_3756 = param3;
         this.var_1182 = new name_1891(param1,param2,name_1891.name_1428);
         this.var_1182.x = 12;
         this.var_1182.y = 12;
         this.var_1182.name_1895 = true;
         window.addChild(this.var_1182);
      }
      
      public function name_1142(param1:int) : void
      {
         this.var_1182.height = param1;
         window.height = param1 + this.var_3756 + 12 * 3;
      }
   }
}
