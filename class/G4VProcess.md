<!-- G4VProcess.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 四 7月 12 07:38:44 2018 (+0800)
;; Last-Updated: 六 7月 14 02:46:16 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 3
;; URL: http://wuhongyi.cn -->

# G4VProcess

This class is the virtual class for physics process objects. It defines public methods which describe the behavior of a physics process.


G4VProcess is the base class for all physics processes.   
Each physics process must implement virtual methods of G4VProcess which describe the interaction (DoIt) and determine when an interaction should occur (GPIL).   

In order to accommodate various types of interactions G4VProcess provides three DoIt methods:  
- G4VParticleChange* AlongStepDoIt( const G4Track& track, const G4Step& stepData )
	- This method is invoked while G4SteppingManager is transporting a particle through one step. 
	- The corresponding AlongStepDoIt for each defined process is applied for every step regardless of which process produces the minimum step length. 
	- Each resulting change to the track information is recorded and accumulated in G4Step. 
	- After all processes have been invoked, changes due to AlongStepDoIt are applied to G4Track, including the particle relocation and the safety update. 
	- Note that after the invocation of AlongStepDoIt, the endpoint of the G4Track object is in a new volume if the step was limited by a geometric boundary. 
	- In order to obtain information about the old volume, G4Step must be accessed, since it contains information about both endpoints of a step.
- G4VParticleChange* PostStepDoIt( const G4Track& track, const G4Step& stepData )
	- This method is invoked at the end point of a step, only if its process has produced the minimum step length, or if the process is forced to occur. 
	- G4Track will be updated after each invocation of PostStepDoIt, in contrast to the AlongStepDoIt method.
- G4VParticleChange* AtRestDoIt( const G4Track& track, const G4Step& stepData )
	- This method is invoked only for stopped particles, and only if its process produced the minimum step length or the process is forced to occur.


For each of the above DoIt methods G4VProcess provides a corresponding pure virtual GPIL method:  
- G4double PostStepGetPhysicalInteractionLength( const G4Track& track, G4double previousStepSize, G4ForceCondition* condition )
	- This method generates the step length allowed by its process. 
	- It also provides a flag to force the interaction to occur regardless of its step length.
- G4double AlongStepGetPhysicalInteractionLength( const G4Track& track, G4double previousStepSize, G4double currentMinimumStep, G4double& proposedSafety, G4GPILSelection* selection )
	- This method generates the step length allowed by its process.
- G4double AtRestGetPhysicalInteractionLength( const G4Track& track, G4ForceCondition* condition )
	- This method generates the step length in time allowed by its process. 
	- It also provides a flag to force the interaction to occur regardless of its step length.


Other pure virtual methods in G4VProcess follow:  
- virtual G4bool IsApplicable(const G4ParticleDefinition&)
	- returns true if this process object is applicable to the particle type.
- virtual void PreparePhysicsTable(const G4ParticleDefinition&) and
- virtual void BuildPhysicsTable(const G4ParticleDefinition&)
	- is messaged by the process manager, whenever cross section tables should be prepared and rebuilt due to changing cut-off values. 
	- It is not mandatory if the process is not affected by cut-off values.
- virtual void StartTracking() and
- virtual void EndTracking()
	- are messaged by the tracking manager at the beginning and end of tracking the current track.



Specialized processes may be derived from seven additional virtual base classes which are themselves derived from G4VProcess.   

Three of these classes are used for simple processes:  
- G4VRestProcess
	- Processes using only the AtRestDoIt method.
	- example: neutron capture
- G4VDiscreteProcess
	- Processes using only the PostStepDoIt method.
	- example: Compton scattering, hadron inelastic interaction
- TODO 说明书这里缺一个

The other four classes are provided for rather complex processes:  

- G4VContinuousDiscreteProcess
	- Processes using both AlongStepDoIt and PostStepDoIt methods.
	- example: transportation, ionisation(energy loss and delta ray)
- G4VRestDiscreteProcess
	- Processes using both AtRestDoIt and PostStepDoIt methods.
	- example: positron annihilation, decay (both in flight and at rest)
- G4VRestContinuousProcess
	- Processes using both AtRestDoIt and AlongStepDoIt methods.
- G4VRestContinuousDiscreteProcess
	- Processes using AtRestDoIt, AlongStepDoIt and PostStepDoIt methods.



----

## class

```cpp
  //  A virtual class for physics process objects. It defines
  //  public methods which describe the behavior of a
  //  physics process.

  private:
  // hide default constructor and assignment operator as private 
  //  do not hide default constructor for alpha version 
  //  G4VProcess G4VProcess();  
      G4VProcess & operator=(const G4VProcess &right);

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
  
  protected:
      const G4ProcessManager* aProcessManager; 
 
  protected:
      G4VParticleChange* pParticleChange;
      //  The pointer to G4VParticleChange object 
      //  which is modified and returned by address by the DoIt() method.
      //  This pointer should be set in each physics process
      //  after construction of derived class object.  

      G4ParticleChange aParticleChange;
      //  This object is kept for compatibility with old scheme
      //  This will be removed in future

      G4double          theNumberOfInteractionLengthLeft;
     // The flight length left for the current tracking particle
     // in unit of "Interaction length".

      G4double          currentInteractionLength;
     // The InteractionLength in the current material

      G4double          theInitialNumberOfInteractionLength;
     // The initial value when ResetNumberOfInteractionLengthLeft is invoked

 public: // with description
      virtual void      ResetNumberOfInteractionLengthLeft();
     // reset (determine the value of)NumberOfInteractionLengthLeft

      G4double GetNumberOfInteractionLengthLeft() const;
     // get NumberOfInteractionLengthLeft

      G4double GetTotalNumberOfInteractionLengthTraversed() const;
     // get NumberOfInteractionLength 
     //   after  ResetNumberOfInteractionLengthLeft is invoked

 protected:  // with description
     void      SubtractNumberOfInteractionLengthLeft(
				  G4double previousStepSize
                                );
     // subtract NumberOfInteractionLengthLeft by the value corresponding to 
     // previousStepSize      
 
     void      ClearNumberOfInteractionLengthLeft();
     // clear NumberOfInteractionLengthLeft 
     // !!! This method should be at the end of PostStepDoIt()
     // !!! and AtRestDoIt

 public: // with description
    // These methods indicate which DoIt is enabled
    // These methods are used by G4ProcessManager to check
    // that ordering parameters are set properly
    G4bool isAtRestDoItIsEnabled() const;
    G4bool isAlongStepDoItIsEnabled() const;
    G4bool isPostStepDoItIsEnabled() const;
  
 protected: 
      G4String theProcessName;
      //  The name of the process

      G4String thePhysicsTableFileName;

      G4ProcessType theProcessType;
      //  The type of the process

      G4int theProcessSubType;
      //  The sub type of the process

      G4double thePILfactor;
      // factor for PhysicsInteractionLength 
      // which is passed to G4SteppingManager
 
      G4bool enableAtRestDoIt;
      G4bool enableAlongStepDoIt;
      G4bool enablePostStepDoIt;
      
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


 protected:
   G4int verboseLevel;
   // controle flag for output message
    
private:
    G4VProcess* masterProcessShadow;
    //For multi-threaded: poitner to the instance of this process
    // for the master thread
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
