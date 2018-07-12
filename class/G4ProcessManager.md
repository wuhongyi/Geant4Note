<!-- G4ProcessManager.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 四 7月 12 05:37:40 2018 (+0800)
;; Last-Updated: 四 7月 12 05:45:51 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4ProcessManager

## Class Description 

It collects all physics a particle can undertake as seven vectors.
These vectors are 
- one vector for all processes (called as "process List")
- two vectors for processes with AtRestGetPhysicalInteractionLength and AtRestDoIt
- two vectors for processes with AlongStepGetPhysicalInteractionLength and AlongStepDoIt
- two vectors for processes with PostStepGetPhysicalInteractionLength and PostStepDoIt

The tracking will message three types of GetPhysicalInteractionLength in order to limit the Step and select the occurence of processes. 

It will message the corresponding DoIt() to apply the selected processes. In addition, the Tracking will limit the Step and select the occurence of the processes according to the shortest physical interaction length computed (except for processes at rest, for which the Tracking will select the occurence of the process which returns the shortest mean life-time from the GetPhysicalInteractionLength()).

----

## class

```cpp
//  Indexes for ProcessVector
enum G4ProcessVectorTypeIndex
{ 
  	typeGPIL = 0,	// for GetPhysicalInteractionLength 
	typeDoIt =1		// for DoIt
};
enum G4ProcessVectorDoItIndex
{
  	idxAll = -1,		// for all DoIt/GPIL 
  	idxAtRest = 0, 		// for AtRestDoIt/GPIL
	idxAlongStep = 1, 	// for AlongStepDoIt/GPIL
	idxPostStep =2,		// for AlongSTepDoIt/GPIL
	NDoit =3
};

//  enumeration for Ordering Parameter      
enum G4ProcessVectorOrdering
{ 
   	ordInActive = -1,	// ordering parameter to indicate InActive DoIt
   	ordDefault = 1000,	// default ordering parameter
   	ordLast    = 9999 	// ordering parameter to indicate the last DoIt
};
```


```cpp
      G4ProcessVector* GetProcessList() const;
      //  Returns the address of the vector of all processes 

      G4int  GetProcessListLength() const;
      //  Returns the number of process in the ProcessVector 

      G4int GetProcessIndex(G4VProcess *) const;
      //  Returns the index of the process in the process List

      // --------------------------------------

      G4ProcessVector* GetProcessVector( 
			       G4ProcessVectorDoItIndex idx,
			       G4ProcessVectorTypeIndex typ = typeGPIL
			      ) const;
      //  Returns the address of the vector of processes 

      G4ProcessVector* GetAtRestProcessVector(
			       G4ProcessVectorTypeIndex typ = typeGPIL
                              ) const; 
      //  Returns the address of the vector of processes for
      //    AtRestGetPhysicalInteractionLength      idx =0
      //    AtRestGetPhysicalDoIt                   idx =1
      G4ProcessVector* GetAlongStepProcessVector(
			       G4ProcessVectorTypeIndex typ = typeGPIL
                              ) const;
      //  Returns the address of the vector of processes for
      //    AlongStepGetPhysicalInteractionLength      idx =0
      //    AlongStepGetPhysicalDoIt                   idx =1

      G4ProcessVector* GetPostStepProcessVector(
			       G4ProcessVectorTypeIndex typ = typeGPIL
                              ) const;
      //  Returns the address of the vector of processes for
      //    PostStepGetPhysicalInteractionLength      idx =0
      //    PostStepGetPhysicalDoIt                   idx =1

      G4int GetProcessVectorIndex(
                           G4VProcess* aProcess,
			   G4ProcessVectorDoItIndex idx,
			   G4ProcessVectorTypeIndex typ  = typeGPIL
			   ) const;
      G4int GetAtRestIndex(
                           G4VProcess* aProcess,
			   G4ProcessVectorTypeIndex typ  = typeGPIL
			   ) const;
      G4int GetAlongStepIndex(
                           G4VProcess* aProcess,
			   G4ProcessVectorTypeIndex typ  = typeGPIL
			   ) const;
      G4int GetPostStepIndex(
			   G4VProcess* aProcess,
			   G4ProcessVectorTypeIndex typ = typeGPIL
			   ) const;
      //  Returns the index for GPIL/DoIt process vector of the process  

      G4int AddProcess(
             G4VProcess *aProcess,
             G4int      ordAtRestDoIt = ordInActive,
             G4int      ordAlongSteptDoIt = ordInActive,
             G4int      ordPostStepDoIt = ordInActive
            );
      //  Add a process to the process List
      //  return values are index to the List. Negative return value 
      //  indicates that the process has not be added due to some errors
      //  The first argument is a pointer to process.
      //  Following arguments are ordering parameters of the process in 
      //  process vectors. If value is negative, the process is
      //  not added to the corresponding process vector. 
   
      //  following methods are provided for simple processes  
      //   AtRestProcess has only AtRestDoIt
      //   ContinuousProcess has only AlongStepDoIt
      //   DiscreteProcess has only PostStepDoIt
      //  If the ording parameter is not specified, the process is
      //  added at the end of List of process vectors 
      //  If a process with same ordering parameter exists, 
      //   this new process will be added just after processes 
      //   with same ordering parameter  
      //  (except for processes assigned to LAST explicitly )
      //  for both DoIt and GetPhysicalInteractionLength
      //  

      G4int AddRestProcess(G4VProcess *aProcess, G4int ord = ordDefault);
      G4int AddDiscreteProcess(G4VProcess *aProcess, G4int ord = ordDefault);
      G4int AddContinuousProcess(G4VProcess *aProcess, G4int ord = ordDefault);


       /////////////////////////////////////////////// 
      // Methods for setting ordering parameters
      // Altanative methods for setting ordering parameters 
      //   Note: AddProcess method should precede these methods

      G4int GetProcessOrdering(
			       G4VProcess *aProcess,
			       G4ProcessVectorDoItIndex idDoIt
                               );

      void SetProcessOrdering(
			       G4VProcess *aProcess,
			       G4ProcessVectorDoItIndex idDoIt,
			       G4int      ordDoIt = ordDefault
                               );
      // Set ordering parameter for DoIt specified by typeDoIt.
      // If a process with same ordering parameter exists, 
      // this new process will be added just after processes 
      // with same ordering parameter  
      // Note: Ordering parameter will bet set to non-zero 
      //       even if you set  ordDoIt = 0
            
     void SetProcessOrderingToFirst(
			       G4VProcess *aProcess,
			       G4ProcessVectorDoItIndex idDoIt
			       );
      // Set ordering parameter to the first of all processes 
      // for DoIt specified by idDoIt.
      //  Note: If you use this method for two processes,
      //        a process called later will be first.

      void SetProcessOrderingToSecond(
			       G4VProcess *aProcess,
			       G4ProcessVectorDoItIndex idDoIt
			       );
      // Set ordering parameter to 1 for DoIt specified by idDoIt
      // and the rpocess will be added just after 
      // the processes with ordering parameter equal to zero
      //  Note: If you use this method for two processes,
      //        a process called later will be .

        void SetProcessOrderingToLast(
			       G4VProcess *aProcess,
			       G4ProcessVectorDoItIndex idDoIt
			       );
      // Set ordering parameter to the last of all processes 
      // for DoIt specified by idDoIt.
      //  Note: If you use this method for two processes,
      //        a process called later will precede.

      G4VProcess*  RemoveProcess(G4VProcess *aProcess);
      G4VProcess*  RemoveProcess(G4int      index);
      //  Removes a process from the process List.
      //  return value is pointer to the removed process.
      //  (0 value will be returned in case of errors)

      G4VProcess* SetProcessActivation(G4VProcess *aProcess, G4bool fActive);
      G4VProcess* SetProcessActivation(G4int      index, G4bool fActive);
      //  Set activation flag. 
      //  return value is pointer to the applied process.
      //  (0 value will be returned in case of errors)

      G4bool GetProcessActivation(G4VProcess *aProcess) const;
      G4bool GetProcessActivation(G4int      index) const;
      //  Get activation flag. 

      G4ParticleDefinition*  GetParticleType() const;
      // get the particle type 
      void SetParticleType(const G4ParticleDefinition*);
      // set the particle type

      G4VProcess* GetProcess (const G4String&) const;
      // get process by process name

      void StartTracking(G4Track* aTrack=0);
      void EndTracking();
      // these two methods are used by G4TrackingManager 
      // in order to inform Start/End of tracking for each track
      // to the process manager and all physics processes 


  public:
      enum {SizeOfProcVectorArray = 6};
```


<!-- G4ProcessManager.md ends here -->
