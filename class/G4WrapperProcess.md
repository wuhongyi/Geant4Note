<!-- G4WrapperProcess.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 二 8月  7 05:17:11 2018 (+0800)
;; Last-Updated: 二 8月  7 05:18:33 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4WrapperProcess

**public G4VProcess**

This class is the virtual class for wrapper process objects. 

## class

```cpp
  //  A virtual class for wrapper process objects.

  private:
  // hide default constructor and assignment operator as private 
  //  do not hide default constructor for alpha version 
      inline G4WrapperProcess & operator=(const G4WrapperProcess &right);

  public: // with description
  //  constructor requires the process name and type
      G4WrapperProcess(const G4String& aName =  "Wrapped",
                 G4ProcessType   aType = fNotDefined );

  //  copy constructor copys the name but does not copy the 
  //  physics table (0 pointer is assigned)
      G4WrapperProcess(const G4WrapperProcess &right);

  public: 
  //  destructor 
      virtual ~G4WrapperProcess();

  // equality opperators
      inline G4int operator==(const G4WrapperProcess &right) const;
      inline G4int operator!=(const G4WrapperProcess &right) const;

  public: // with description
    virtual void              RegisterProcess(G4VProcess*);
    virtual const G4VProcess* GetRegisteredProcess() const;

  protected:
    G4VProcess* pRegProcess;

  public: // with description
  ////////////////////////////
  // DoIt    /////////////////
  ///////////////////////////
      virtual G4VParticleChange* PostStepDoIt(
                             const G4Track& track,
                             const G4Step&  stepData
                            );

      virtual G4VParticleChange* AlongStepDoIt(
                             const G4Track& track,
                             const G4Step& stepData
                            );
      virtual G4VParticleChange* AtRestDoIt(
                             const G4Track& track,
                             const G4Step& stepData
                            );
  //////////////////////////
  // GPIL    //////////////
  /////////////////////////  
      virtual G4double AlongStepGetPhysicalInteractionLength(
                             const G4Track& track,
                             G4double  previousStepSize,
                             G4double  currentMinimumStep,
                             G4double& proposedSafety,
                             G4GPILSelection* selection);

      virtual G4double AtRestGetPhysicalInteractionLength(
                             const G4Track& track,
                             G4ForceCondition* condition
                            );

      virtual G4double PostStepGetPhysicalInteractionLength(
                             const G4Track& track,
                             G4double   previousStepSize,
                             G4ForceCondition* condition
                            ) ;
  
  ////////////////////// 
      virtual G4bool IsApplicable(const G4ParticleDefinition&);
      // Returns true if this process object is applicable to
      // the particle type
      // Process will not be registered to a particle if IsApplicable is false   

      virtual void BuildPhysicsTable(const G4ParticleDefinition&);
      // Messaged by the Particle definition (via the Process manager)
      // whenever cross section tables have to be rebuilt (i.e. if new
      // materials have been defined). 
      // It is overloaded by individual processes when they need physics
      // tables. 

      // Processes which Build (for example in their
      // constructors) physics tables independent of cuts
      // should preferably use a
      // private void BuildThePhysicsTable()
      // function. Not another BuildPhysicsTable, please.
 
      virtual void PreparePhysicsTable(const G4ParticleDefinition&);
      // Messaged by the Particle definition (via the Process manager)
      // whenever cross section tables have to be prepare for rebuilt 
      // (i.e. if new materials have been defined). 
      // It is overloaded by individual processes when they need physics
      // tables. 

      // Processes which Build physics tables independent of cuts
      // (for example in their constructors)
      // should preferably use private 
      // void BuildThePhysicsTable() and void PreparePhysicsTable().
      // Not another BuildPhysicsTable, please.


      virtual G4bool StorePhysicsTable(const G4ParticleDefinition* ,
                                       const G4String& directory, 
                                       G4bool          ascii = false); 
      // Store PhysicsTable in a file. 
      // (return false in case of failure at I/O ) 
 
      virtual G4bool RetrievePhysicsTable( const G4ParticleDefinition* ,
                                           const G4String& directory, 
                                           G4bool          ascii = false);
      // Retrieve Physics from a file. 
      // (return true if the Physics Table can be build by using file)
      // (return false if the process has no functionality or in case of failure)
      // File name should be defined by each process 
      // and the file should be placed under the directory specifed by the argument. 
  ////////////////////////////
      virtual void StartTracking(G4Track*);
      virtual void EndTracking();
      // inform Start/End of tracking for each track to the physics process 
 
  public:
      virtual void SetProcessManager(const G4ProcessManager*); 
      // A process manager set its own pointer when the process is registered
      // the process Manager
      virtual  const G4ProcessManager* GetProcessManager(); 
      // Get the process manager which the process belongs to
  
   public:
      virtual void      ResetNumberOfInteractionLengthLeft();
      // reset (determine the value of)NumberOfInteractionLengthLeft
      virtual void SetMasterProcess(G4VProcess* masterP);
     // Needed for MT, forward call to underlying process 
```

<!-- G4WrapperProcess.md ends here -->
