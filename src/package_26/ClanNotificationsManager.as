package package_26
{
   import alternativa.tanks.gui.class_144;
   import flash.events.EventDispatcher;
   import flash.utils.Dictionary;
   import package_13.Long;
   
   public class ClanNotificationsManager
   {
      
      private static var var_1657:Vector.<class_144> = new Vector.<class_144>();
      
      private static var var_1655:Vector.<class_144> = new Vector.<class_144>();
      
      private static var var_1656:Dictionary = new Dictionary();
      
      private static var var_1658:Dictionary = new Dictionary();
      
      private static var var_1654:int = 0;
      
      private static var var_1653:int = 0;
      
      public static var dispatcher:EventDispatcher = new EventDispatcher();
       
      
      public function ClanNotificationsManager()
      {
         super();
      }
      
      public static function name_1882() : void
      {
         var_1657 = new Vector.<class_144>();
         var_1655 = new Vector.<class_144>();
      }
      
      public static function method_1827() : int
      {
         return var_1654;
      }
      
      public static function method_1826() : int
      {
         return var_1653;
      }
      
      public static function name_1944(param1:Long) : void
      {
         ++var_1654;
         var_1656[param1] = true;
         method_1825(var_1657);
      }
      
      public static function name_1946(param1:Long) : void
      {
         if(param1 in var_1656)
         {
            --var_1654;
            delete var_1656[param1];
            method_1825(var_1657);
         }
      }
      
      public static function name_1906(param1:Long) : void
      {
         ++var_1653;
         var_1658[param1] = true;
         method_1825(var_1655);
      }
      
      public static function name_1907(param1:Long) : void
      {
         if(param1 in var_1658)
         {
            --var_1653;
            delete var_1658[param1];
            method_1825(var_1655);
         }
      }
      
      public static function name_1949(param1:Long) : Boolean
      {
         return param1 in var_1656;
      }
      
      public static function name_869(param1:Long) : Boolean
      {
         return param1 in var_1658;
      }
      
      public static function method_1828(param1:Long) : void
      {
         if(name_869(param1))
         {
            dispatcher.dispatchEvent(new ClanNotificationEvent(ClanNotificationEvent.REMOVE_ACCEPTED_NOTIFICATION,param1));
         }
      }
      
      public static function name_1917(param1:Long) : void
      {
         if(name_1949(param1))
         {
            dispatcher.dispatchEvent(new ClanNotificationEvent(ClanNotificationEvent.REMOVE_INCOMING_NOTIFICATION,param1));
         }
      }
      
      public static function name_1878(param1:class_144) : void
      {
         var_1657.push(param1);
      }
      
      public static function name_1883(param1:class_144) : void
      {
         var_1655.push(param1);
      }
      
      private static function method_1825(param1:Vector.<class_144>) : void
      {
         var _loc2_:class_144 = null;
         for each(_loc2_ in param1)
         {
            _loc2_.updateNotifications();
         }
      }
      
      public static function name_1945(param1:Vector.<Long>) : void
      {
         var _loc2_:Long = null;
         var_1654 = 0;
         for each(_loc2_ in param1)
         {
            ++var_1654;
            var_1656[_loc2_] = true;
         }
         method_1825(var_1657);
      }
      
      public static function name_1908(param1:Vector.<Long>) : void
      {
         var _loc2_:Long = null;
         var_1653 = 0;
         for each(_loc2_ in param1)
         {
            ++var_1653;
            var_1658[_loc2_] = true;
         }
         method_1825(var_1655);
      }
      
      public static function name_1999() : int
      {
         return method_1826() + method_1827();
      }
   }
}
