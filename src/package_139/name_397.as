package package_139
{
   import package_140.CountableItemModelBase;
   import package_140.class_54;
   import platform.client.fp10.core.model.class_11;
   
   public class name_397 extends CountableItemModelBase implements class_54, name_1538, class_11
   {
       
      
      public function name_397()
      {
         super();
      }
      
      public function getCount() : int
      {
         return int(getData(name_397));
      }
      
      public function setCount(param1:int) : void
      {
         putData(name_397,param1);
      }
      
      public function method_1105() : Boolean
      {
         return this.getCount() == 0;
      }
      
      public function objectLoaded() : void
      {
         putData(name_397,method_771().count);
      }
      
      public function objectLoadedPost() : void
      {
      }
      
      public function objectUnloaded() : void
      {
      }
      
      public function objectUnloadedPost() : void
      {
      }
   }
}
