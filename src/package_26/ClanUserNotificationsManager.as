package package_26
{
   import alternativa.tanks.gui.class_144;
   import flash.events.EventDispatcher;
   import flash.utils.Dictionary;
   import package_13.Long;
   
   public class ClanUserNotificationsManager
   {
      
      private static var var_1657:Vector.<class_144> = new Vector.<class_144>();
      
      private static var var_1656:Dictionary = new Dictionary();
      
      public static var dispatcher:EventDispatcher = new EventDispatcher();
      
      private static var count:int;
       
      
      public function ClanUserNotificationsManager()
      {
         super();
      }
      
      public static function name_1880() : void
      {
         var_1657 = new Vector.<class_144>();
         var_1656 = new Dictionary();
         count = 0;
      }
      
      public static function name_1878(param1:class_144) : void
      {
         var_1657.push(param1);
         param1.updateNotifications();
      }
      
      public static function name_1954(param1:class_144) : void
      {
         var _loc2_:Number = var_1657.indexOf(param1);
         if(_loc2_ > 0)
         {
            var_1657.splice(_loc2_,1);
         }
      }
      
      public static function name_1917(param1:Long) : void
      {
         if(name_1873(param1))
         {
            dispatcher.dispatchEvent(new ClanNotificationEvent(ClanNotificationEvent.REMOVE_INCOMING_NOTIFICATION,param1));
         }
      }
      
      public static function name_1873(param1:Long) : Boolean
      {
         return param1 in var_1656;
      }
      
      public static function name_1945(param1:Vector.<Long>) : void
      {
         var _loc2_:Long = null;
         count = 0;
         for each(_loc2_ in param1)
         {
            ++count;
            var_1656[_loc2_] = true;
         }
         method_1825(var_1657);
      }
      
      public static function name_1944(param1:Long) : void
      {
         if(!(param1 in var_1656))
         {
            ++count;
            var_1656[param1] = true;
            method_1825(var_1657);
         }
      }
      
      public static function name_1946(param1:Long) : void
      {
         if(param1 in var_1656)
         {
            --count;
            delete var_1656[param1];
            method_1825(var_1657);
         }
      }
      
      public static function name_1941() : int
      {
         return count;
      }
      
      private static function method_1825(param1:Vector.<class_144>) : void
      {
         var _loc2_:class_144 = null;
         for each(_loc2_ in param1)
         {
            _loc2_.updateNotifications();
         }
      }
   }
}
