package package_159
{
   import flash.utils.Dictionary;
   
   public class BCSHModel
   {
       
      
      private var filters:Dictionary;
      
      public function BCSHModel()
      {
         super();
         this.filters = new Dictionary();
      }
      
      public function putData(param1:String, param2:name_1600) : void
      {
         this.filters[param1] = param2;
      }
      
      public function getData(param1:String) : name_1600
      {
         return this.filters[param1];
      }
   }
}
