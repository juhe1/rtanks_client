package alternativa.tanks.model.item.resistance
{
   import alternativa.osgi.OSGi;
   import package_142.MountedResistancesModelBase;
   import package_142.name_1644;
   import package_89.name_1358;
   import platform.client.fp10.core.model.name_141;
   import platform.client.fp10.core.model.name_287;
   import platform.client.fp10.core.type.name_70;
   
   public class MountedResistancesModel extends MountedResistancesModelBase implements name_1644, name_141, name_287, name_1525
   {
      
      public static var var_2347:name_1358 = OSGi.getInstance().getService(name_1358) as name_1358;
       
      
      private var var_2415:Vector.<name_70>;
      
      public function MountedResistancesModel()
      {
         super();
      }
      
      public function name_1526() : Vector.<name_70>
      {
         return this.var_2415;
      }
      
      public function objectUnloaded() : void
      {
         var_2347.method_1068();
      }
      
      public function objectLoadedPost() : void
      {
         this.var_2415 = new Vector.<name_70>().concat(method_771().resistances);
         var_2347.method_117(object);
      }
      
      public function mount(param1:int, param2:name_70) : void
      {
         server.mount(param1,param2);
         var _loc3_:* = this.var_2415.indexOf(param2);
         if(_loc3_ > -1)
         {
            this.var_2415.splice(_loc3_,1);
         }
         this.var_2415.push(param2);
      }
      
      public function name_1370(param1:name_70) : void
      {
         this.var_2415.splice(this.var_2415.indexOf(param1),1);
         server.name_1370(param1);
      }
   }
}
