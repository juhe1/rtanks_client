package alternativa.tanks.model.item.resistance
{
   import flash.display.DisplayObjectContainer;
   import flash.events.IEventDispatcher;
   import package_103.name_323;
   import package_142.class_187;
   import package_142.name_1645;
   import package_326.class_55;
   import package_341.name_1633;
   import package_343.name_1638;
   import package_41.ItemProperty;
   import package_96.name_311;
   
   public class ResistanceModuleModel extends class_187 implements name_1645, name_1638, class_55
   {
       
      
      private var var_2414:name_311;
      
      public function ResistanceModuleModel()
      {
         super();
      }
      
      public function getPanel() : name_311
      {
         if(this.var_2414 == null)
         {
            this.var_2414 = new name_311();
         }
         return this.var_2414;
      }
      
      public function method_501() : Vector.<ItemProperty>
      {
         var _loc1_:Vector.<name_323> = this.getProperties();
         var _loc2_:Vector.<ItemProperty> = new Vector.<ItemProperty>(_loc1_.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc1_.length)
         {
            _loc2_[_loc3_] = _loc1_[_loc3_].property;
            _loc3_++;
         }
         return _loc2_;
      }
      
      private function getProperties() : Vector.<name_323>
      {
         if(object.method_316(name_1633))
         {
            return name_1633(object.name_176(name_1633)).getProperties();
         }
         return null;
      }
      
      public function handleDoubleClickOnItemPreview() : void
      {
         this.getPanel().onDoubleClick();
      }
      
      public function updateActionElements(param1:DisplayObjectContainer, param2:IEventDispatcher) : void
      {
         this.getPanel().updateActionElements(param1,param2,object);
      }
   }
}
