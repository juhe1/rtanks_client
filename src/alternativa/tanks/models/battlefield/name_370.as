package alternativa.tanks.models.battlefield
{
   public class name_370
   {
      
      public static const DM:name_370 = new name_370(0);
      
      public static const TDM:name_370 = new name_370(1);
      
      public static const CTF:name_370 = new name_370(2);
      
      public static const DOM:name_370 = new name_370(3);
       
      
      private var _value:int;
      
      public function name_370(param1:int)
      {
         super();
         this._value = param1;
      }
      
      public function get value() : int
      {
         return this._value;
      }
   }
}
