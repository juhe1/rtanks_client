package alternativa.osgi
{
   import alternativa.model.IModel;
   import package_11.IBundleActivator;
   import package_7.name_32;
   
   public class CommonBundleActivator implements IBundleActivator
   {
       
      
      protected var models:Vector.<IModel>;
      
      public function CommonBundleActivator()
      {
         this.models = new Vector.<IModel>();
         super();
      }
      
      public function start(param1:OSGi) : void
      {
      }
      
      public function stop(param1:OSGi) : void
      {
         var _loc3_:IModel = null;
         var _loc4_:name_511 = null;
         var _loc2_:name_32 = name_32(param1.getService(name_32));
         while((_loc3_ = this.models.pop()) != null)
         {
            _loc4_ = _loc3_ as name_511;
            if(_loc4_ != null)
            {
               _loc4_.name_513();
            }
            _loc2_.remove(_loc3_.id);
         }
      }
      
      protected function method_117(param1:IModel, param2:OSGi) : void
      {
         var _loc3_:name_32 = name_32(param2.getService(name_32));
         _loc3_.add(param1);
         this.models.push(param1);
         var _loc4_:name_511 = param1 as name_511;
         if(_loc4_ != null)
         {
            _loc4_.name_512();
         }
      }
   }
}
