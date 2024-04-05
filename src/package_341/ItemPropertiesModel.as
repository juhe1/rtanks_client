package package_341
{
   import package_103.name_323;
   import package_132.ItemPropertiesModelBase;
   import package_132.name_1651;
   
   public class ItemPropertiesModel extends ItemPropertiesModelBase implements name_1651, name_1633
   {
       
      
      public function ItemPropertiesModel()
      {
         super();
      }
      
      public function getProperties() : Vector.<name_323>
      {
         var _loc1_:Vector.<name_323> = null;
         var _loc2_:name_323 = null;
         var _loc3_:Object = getData(Vector);
         if(_loc3_ == null)
         {
            _loc1_ = new Vector.<name_323>();
            for each(_loc2_ in method_771().properties)
            {
               _loc1_.push(_loc2_);
            }
            putData(Vector,_loc1_);
         }
         else
         {
            _loc1_ = Vector.<name_323>(_loc3_);
         }
         return _loc1_;
      }
      
      public function method_2414() : Vector.<name_323>
      {
         return this.getProperties();
      }
   }
}
