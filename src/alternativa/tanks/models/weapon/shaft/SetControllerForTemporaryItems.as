package alternativa.tanks.models.weapon.shaft
{
   import flash.utils.Dictionary;
   
   public class SetControllerForTemporaryItems
   {
       
      
      private var var_3104:Vector.<Object>;
      
      private var var_3105:Dictionary;
      
      public function SetControllerForTemporaryItems(param1:Dictionary)
      {
         this.var_3104 = new Vector.<Object>();
         super();
         this.var_3105 = param1;
      }
      
      public function name_2470(param1:Object) : void
      {
         this.var_3105[param1] = true;
         this.var_3104.push(param1);
      }
      
      public function name_2471() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.var_3104.length)
         {
            delete this.var_3105[this.var_3104[_loc1_]];
            _loc1_++;
         }
         this.var_3104.length = 0;
      }
   }
}
