<!-- G4PhysicsListHelper.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 四 7月 12 23:03:44 2018 (+0800)
;; Last-Updated: 六 7月 14 02:42:24 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 2
;; URL: http://wuhongyi.cn -->

# G4PhysicsListHelper

This class is a helper class for physics lists to register processes according to the ordering parameter table   
This class is a singleton  








## class

```cpp
  private:
   // Hide constructor and destructor 
   G4PhysicsListHelper();
   virtual ~G4PhysicsListHelper();

  public:  // with description
   // This method gives the ponter to the physics list helper 
   static G4PhysicsListHelper* GetPhysicsListHelper(); 
  
   //Register a process to the particle type 
   // according to the ordering parameter table
   //  'true' is returned if the process is registerd successfully
   G4bool RegisterProcess(G4VProcess*            process,
			  G4ParticleDefinition*  particle);

   //  User must invoke this method in his ConstructProcess() 
   //  implementation in order to insures particle transportation.
   void AddTransportation();
   
   //  Set flag for using CoupledTransportation
   void UseCoupledTransportation(G4bool vl=true);
 
  /////////////////////////////////////////////////////////////////
  public:
    // check consistencies of list of particles 
    void CheckParticleList() const;

  ///////////////////////////////////////////////////////////////////////
  public: 
  // Dump OrdingParameterTable
    void DumpOrdingParameterTable(G4int subType = -1) const;
    G4PhysicsListOrderingParameter GetOrdingParameter(G4int subType) const;

  private: 
    void ReadOrdingParameterTable();
    void ReadInDefaultOrderingParameter();

  ///////////////////////////////////////////////////////////////////////
  public: // with description
    void  SetVerboseLevel(G4int value);
    G4int GetVerboseLevel() const;
    // set/get controle flag for output message
    //  0: Silent
    //  1: Warning message
    //  2: More
```

<!-- G4PhysicsListHelper.md ends here -->
