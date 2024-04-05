package alternativa.tanks.model
{
   import alternativa.model.name_66;
   import flash.utils.Dictionary;
   import package_1.Main;
   import package_328.class_57;
   import package_328.class_58;
   import package_7.name_32;
   
   public class ItemEffectModel extends class_57 implements class_58, name_364
   {
       
      
      private var modelRegister:name_32;
      
      private var var_889:Dictionary;
      
      private var var_891:Dictionary;
      
      private var var_890:Dictionary;
      
      public function ItemEffectModel()
      {
         super();
         var_365.push(name_66);
         var_365.push(name_364);
         var_365.push(class_58);
         this.var_889 = new Dictionary();
         this.var_890 = new Dictionary();
         this.modelRegister = Main.osgi.name_6(name_32) as name_32;
      }
      
      public function name_399(param1:String, param2:Number) : void
      {
         var _loc4_:int = 0;
         this.var_889[param1] = param2;
         var _loc3_:Vector.<name_66> = this.modelRegister.getModelsByInterface(class_51);
         if(_loc3_ != null)
         {
            _loc4_ = 0;
            while(_loc4_ < _loc3_.length)
            {
               (_loc3_[_loc4_] as class_51).method_1076(param1,param2);
               _loc4_++;
            }
         }
      }
      
      public function method_36(param1:String) : void
      {
         var _loc3_:int = 0;
         this.var_889[param1] = null;
         var _loc2_:Vector.<name_66> = this.modelRegister.getModelsByInterface(class_51);
         if(_loc2_ != null)
         {
            _loc3_ = 0;
            while(_loc3_ < _loc2_.length)
            {
               (_loc2_[_loc3_] as class_51).method_36(param1);
               _loc3_++;
            }
         }
      }
      
      public function method_1113(param1:String) : Number
      {
         return Number(this.var_889[param1]);
      }
   }
}
