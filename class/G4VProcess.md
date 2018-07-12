<!-- G4VProcess.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 四 7月 12 07:38:44 2018 (+0800)
;; Last-Updated: 四 7月 12 07:42:40 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4VProcess

This class is the virtual class for physics process objects. It defines public methods which describe the behavior of a physics process.

## class


```cpp
  public: // with description
  //  constructor requires the process name and type
      G4VProcess(const G4String& aName =  "NoName",
		 G4ProcessType   aType = fNotDefined );

  //  copy constructor copys the name but does not copy the 
  //  physics table (0 pointer is assigned)
      G4VProcess(const G4VProcess &right);

  public: 
  //  destructor 
      virtual ~G4VProcess();

  // equal opperators
      G4int operator==(const G4VProcess &right) const;
      G4int operator!=(const G4VProcess &right) const;


  public: // with description
  ////////////////////////////
  // DoIt    /////////////////
  ///////////////////////////
      virtual G4VParticleChange* PostStepDoIt(
			     const G4Track& track,
			     const G4Step&  stepData
			    ) = 0;

      virtual G4VParticleChange* AlongStepDoIt(
			     const G4Track& track,
			     const G4Step& stepData
			    ) = 0;
      virtual G4VParticleChange* AtRestDoIt(
			     const G4Track& track,
			     const G4Step& stepData
			    ) = 0;
      //  A virtual base class function that has to be overridden
      //  by any subclass. The DoIt method actually performs the
      //  physics process and determines either momentum change
      //  of the production of secondaries etc.
      //    arguments
      //      const G4Track&    track:
      //        reference to the current G4Track information
      //      const G4Step&     stepData:
      //        reference to the current G4Step information

  //////////////////////////
  // GPIL    //////////////
  /////////////////////////  
      virtual G4double AlongStepGetPhysicalInteractionLength(
                             const G4Track& track,
			     G4double  previousStepSize,
			     G4double  currentMinimumStep,
			     G4double& proposedSafety,
                             G4GPILSelection* selection) = 0;

      virtual G4double AtRestGetPhysicalInteractionLength(
                             const G4Track& track,
			     G4ForceCondition* condition
			    ) = 0;

      virtual G4double PostStepGetPhysicalInteractionLength(
                             const G4Track& track,
			     G4double   previousStepSize,
			     G4ForceCondition* condition
			    ) = 0;
  
      //  Returns the Step-size (actual length) which is allowed 
      //  by "this" process. (for AtRestGetPhysicalInteractionLength,
      //  return value is Step-time) The NumberOfInteractionLengthLeft is
      //  recalculated by using previousStepSize and the Step-size is 
      //  calucalted accoding to the resultant NumberOfInteractionLengthLeft.
      //  using NumberOfInteractionLengthLeft, which is recalculated at 
      //    arguments
      //      const G4Track&    track:
      //        reference to the current G4Track information
      //      G4double*          previousStepSize: 
      //        the Step-size (actual length) of the previous Step 
      //        of this track. Negative calue indicates that
      //        NumberOfInteractionLengthLeft must be reset.
      //        the current physical interaction legth of this process
      //      G4ForceCondition* condition:
      //        the flag indicates DoIt of this process is forced 
      //        to be called
      //         Forced:    Corresponding DoIt is forced
      //         NotForced: Corresponding DoIt is called 
      //                    if the Step size of this Step is determined 
      //                    by this process
      //        !! AlongStepDoIt is always called !! 
      //      G4double& currentMinimumStep:
      //        this value is used for transformation of
      //        true path length to geometrical path length

      G4double GetCurrentInteractionLength() const;
      // Returns currentInteractionLength

      ////////// PIL factor ////////
      void SetPILfactor(G4double value);
      G4double GetPILfactor() const;
      // Set/Get factor for PhysicsInteractionLength 
      // which is passed to G4SteppingManager for both AtRest and PostStep

      // These three GPIL methods are used by Stepping Manager.
      // They invoke virtual GPIL methods listed above.
      // As for AtRest and PostStep the returned value is multipled by thePILfactor 
      // 
      G4double AlongStepGPIL( const G4Track& track,
                              G4double  previousStepSize,
                              G4double  currentMinimumStep,
                              G4double& proposedSafety,
                              G4GPILSelection* selection     );

      G4double AtRestGPIL( const G4Track& track,
                           G4ForceCondition* condition );

      G4double PostStepGPIL( const G4Track& track,
                             G4double   previousStepSize,
                             G4ForceCondition* condition );

  ////////////////////// 
      virtual G4bool IsApplicable(const G4ParticleDefinition&){return true;}
      // Returns true if this process object is applicable to
      // the particle type
      // Process will not be registered to a particle if IsApplicable is false   

      virtual void BuildPhysicsTable(const G4ParticleDefinition&){}
      // Messaged by the Particle definition (via the Process manager)
      // whenever cross section tables have to be rebuilt (i.e. if new
      // materials have been defined). 
      // It is overloaded by individual processes when they need physics
      // tables. 

     virtual void PreparePhysicsTable(const G4ParticleDefinition&){}
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
				       const G4String&, G4bool){return true;}
      // Store PhysicsTable in a file.
      // (return false in case of failure at I/O )

      virtual G4bool RetrievePhysicsTable( const G4ParticleDefinition* ,
					   const G4String&, G4bool){return false;}
      // Retrieve Physics from a file.
      // (return true if the Physics Table can be build by using file)
      // (return false if the process has no functionality or in case of failure)
      // File name should be defined by each process
      // and the file should be placed under the directory specifed by the argument.
      const G4String& GetPhysicsTableFileName(const G4ParticleDefinition* ,
					      const G4String& directory,
					      const G4String& tableName,
					      G4bool ascii =false);
      // this method is utility for Store/RetreivePhysicsTable

  ////////////////////////////
      const G4String& GetProcessName() const;
      //  Returns the name of the process.

      G4ProcessType GetProcessType() const;
      //  Returns the process type.

      void SetProcessType(G4ProcessType );
      //  Set the process type.

      G4int GetProcessSubType() const;
      //  Returns the process sub type.

      void SetProcessSubType(G4int );
      //  Set the process sub type.

      static const G4String& GetProcessTypeName(G4ProcessType );
      //  Returns the process type name

      virtual void StartTracking(G4Track*);
      virtual void EndTracking();
      // inform Start/End of tracking for each track to the physics process 

  public:
      virtual void SetProcessManager(const G4ProcessManager*); 
      // A process manager set its own pointer when the process is registered
      // the process Manager
      virtual  const G4ProcessManager* GetProcessManager(); 
      // Get the process manager which the process belongs to



 public: // with description
      virtual void      ResetNumberOfInteractionLengthLeft();
     // reset (determine the value of)NumberOfInteractionLengthLeft

      G4double GetNumberOfInteractionLengthLeft() const;
     // get NumberOfInteractionLengthLeft

      G4double GetTotalNumberOfInteractionLengthTraversed() const;
     // get NumberOfInteractionLength 
     //   after  ResetNumberOfInteractionLengthLeft is invoked


 public: // with description
    // These methods indicate which DoIt is enabled
    // These methods are used by G4ProcessManager to check
    // that ordering parameters are set properly
    G4bool isAtRestDoItIsEnabled() const;
    G4bool isAlongStepDoItIsEnabled() const;
    G4bool isPostStepDoItIsEnabled() const;


 public: // with description
   virtual void  DumpInfo() const;
   // dump out process information    

   virtual void ProcessDescription(std::ostream& outfile) const;
   // write out to html file for automatic documentation

 public: // with description
   void  SetVerboseLevel(G4int value);
   G4int GetVerboseLevel() const;
   // set/get controle flag for output message
   //  0: Silent
   //  1: Warning message
   //  2: More



public:
    virtual void SetMasterProcess( G4VProcess* masterP);
    // Sets the master thread process instance
    const G4VProcess* GetMasterProcess() const;
    // Returns the master thread process instnace
    // Can be used to initialize worker type processes
    // instances from master one (e.g. to share a read-only table)
    // if ( this != GetMasterProcess() ) { /*worker*/ }
    // else { /* master or sequential */ }

    virtual void BuildWorkerPhysicsTable(const G4ParticleDefinition& part);
    // Messaged by the Particle definition (via the Process manager)
    // in worker threads. See BuildWorkerBhyiscsTable method.
    // Can be used to share among threads physics tables. Use GetMasterProcess
    // to get pointer of master process from worker thread.
    // By default this method makes a forward call to
    // BuildPhysicsTable
    
    virtual void PrepareWorkerPhysicsTable(const G4ParticleDefinition&);
    // Messaged by the Particle definition (via the Process manager)
    // in worker threads. See PreparephysicsTable
    // Can be used to share among threads physics tables. Use GetMasterProcess
    // to get pointer of master process from worker thread
    // By default this method makes a forward call
    // to PreparePhysicsTable

```









<!-- G4VProcess.md ends here -->
