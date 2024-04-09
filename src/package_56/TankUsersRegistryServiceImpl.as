package package_56
{
   import alternativa.tanks.models.tank.ITank;
   import flash.utils.Dictionary;
   import package_13.Long;
   import platform.client.fp10.core.type.name_70;
   
   public class TankUsersRegistryServiceImpl implements name_95
   {
       
      
      private const users:Dictionary = new Dictionary();
      
      private var var_594:Vector.<name_70>;
      
      private var var_595:int;
      
      private var name_700:name_70;
      
      public function TankUsersRegistryServiceImpl()
      {
         super();
      }
      
      public function addUser(param1:name_70) : void
      {
         this.var_594 = null;
         if(!this.users[param1.id])
         {
            this.users[param1.id] = param1;
            ++this.var_595;
         }
         if(ITank(param1.name_176(ITank)).isLocal())
         {
            this.name_700 = param1;
         }
      }
      
      public function removeUser(param1:name_70) : void
      {
         this.var_594 = null;
         if(Boolean(this.users[param1.id]))
         {
            delete this.users[param1.id];
            --this.var_595;
         }
         if(ITank(param1.name_176(ITank)).isLocal())
         {
            this.name_700 = null;
         }
      }
      
      public function method_571() : int
      {
         return this.var_595;
      }
      
      public function method_573() : Vector.<name_70>
      {
         var _loc1_:name_70 = null;
         if(this.var_594 == null)
         {
            this.var_594 = new Vector.<name_70>();
            for each(_loc1_ in this.users)
            {
               this.var_594.push(_loc1_);
            }
         }
         return this.var_594;
      }
      
      public function method_484(param1:Long) : name_70
      {
         return this.users[param1];
      }
      
      public function method_574() : name_70
      {
         return this.name_700;
      }
      
      public function method_572() : Boolean
      {
         return this.name_700 != null;
      }
   }
}
