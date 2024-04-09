package alternativa.tanks.model
{
   import alternativa.model.IModel;
   import flash.utils.Dictionary;
   import package_1.Main;
   import package_103.class_190;
   import package_103.class_191;
   import package_103.name_328;
   import package_105.name_321;
   import package_13.Long;
   import package_4.ClientObject;
   import package_7.name_32;
   
   public class ItemModel extends class_191 implements class_190, name_1535
   {
       
      
      private var params:Dictionary;
      
      public function ItemModel()
      {
         super();
         _interfaces.push(IModel);
         _interfaces.push(name_1535);
         _interfaces.push(class_190);
         this.params = new Dictionary();
      }
      
      public function initObject(param1:ClientObject, param2:String, param3:String, param4:int, param5:name_321, param6:int, param7:Array, param8:String, param9:Long) : void
      {
         var _loc10_:name_328 = null;
         var _loc11_:int = 0;
         var _loc12_:name_328 = name_328(param7[param6]);
         if(param7[param6 + 1] != null)
         {
            _loc10_ = name_328(param7[param6 + 1]);
         }
         this.params[param1] = new name_324(param2,param3,param5 == name_321.INVENTORY,param4,_loc12_.itemProperties,param5,param6,param8,_loc10_ != null ? int(_loc10_.crystalPrice) : int(0),_loc10_ != null ? _loc10_.itemProperties : null,_loc10_ != null ? int(_loc10_.rankId) : int(0),param9,_loc12_.crystalPrice,_loc12_.rankId,param7,true);
         Main.method_8("ITEM MODEL","initObject  baseItemId: %1",param2);
         var _loc13_:name_32 = Main.osgi.getService(name_32) as name_32;
         var _loc14_:Vector.<IModel> = _loc13_.getModelsByInterface(class_50);
         if(_loc14_ != null)
         {
            _loc11_ = 0;
            while(_loc11_ < _loc14_.length)
            {
               (_loc14_[_loc11_] as class_50).method_1075(param1,this.params[param1]);
               _loc11_++;
            }
         }
      }
      
      public function method_16(param1:ClientObject) : name_324
      {
         return this.params[param1];
      }
   }
}
