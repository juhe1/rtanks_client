package alternativa.tanks.model
{
   import alternativa.model.class_11;
   import alternativa.model.name_66;
   import package_1.Main;
   import package_105.name_321;
   import package_4.ClientObject;
   import package_436.class_188;
   import package_436.class_189;
   import package_437.name_2663;
   import package_438.name_2662;
   import package_7.name_32;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   
   public class Item3DModel extends class_189 implements class_188, class_11
   {
       
      
      private var clientObject:ClientObject;
      
      private var name_373:name_321;
      
      public function Item3DModel()
      {
         super();
         var_365.push(name_66);
         var_365.push(class_188);
         var_365.push(class_11);
      }
      
      public function initObject(param1:ClientObject, param2:name_321) : void
      {
         Main.method_7("\n\n\nItem3DModel init clientObject id:" + param1.id + "\n\n\n");
         this.clientObject = param1;
         this.name_373 = param2;
      }
      
      public function objectLoaded(param1:ClientObject) : void
      {
         var _loc2_:name_32 = null;
         var _loc5_:name_2662 = null;
         var _loc6_:name_2663 = null;
         var _loc7_:Tanks3DSResource = null;
         Main.method_7("Item3DModel objectLoaded");
         _loc2_ = Main.osgi.name_6(name_32) as name_32;
         var _loc3_:Vector.<name_66> = _loc2_.getModelsByInterface(name_381) as Vector.<name_66>;
         var _loc4_:name_381 = _loc3_[0] as name_381;
         if(_loc4_ != null)
         {
            _loc5_ = _loc2_.method_260(this.clientObject,name_2662) as name_2662;
            switch(this.name_373)
            {
               case name_321.ARMOR:
                  if(_loc5_ != null)
                  {
                     _loc7_ = _loc5_.name_2664(this.clientObject);
                     Main.method_7("Item3DModel setHull resource: " + _loc7_);
                  }
                  break;
               case name_321.WEAPON:
                  if(_loc5_ != null)
                  {
                     _loc7_ = _loc5_.name_2664(this.clientObject);
                     Main.method_7("Item3DModel setTurret resource: " + _loc7_);
                  }
                  break;
               case name_321.COLOR:
                  _loc6_ = _loc2_.method_260(this.clientObject,name_2663) as name_2663;
                  break;
               case name_321.INVENTORY:
            }
         }
         else
         {
            Main.method_7("Item3DModel garageModel = null");
         }
      }
      
      public function objectUnloaded(param1:ClientObject) : void
      {
         Main.method_7("Item3DModel objectUnloaded");
         this.clientObject = null;
      }
   }
}
