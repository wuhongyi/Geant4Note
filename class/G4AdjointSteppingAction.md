<!-- G4AdjointSteppingAction.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 五 8月 10 08:08:55 2018 (+0800)
;; Last-Updated: 五 8月 10 08:09:57 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4AdjointSteppingAction

**public G4UserSteppingAction**

```cpp
//	Documentation:
//		Stepping action used in the adjoint simulation. 
//		It is responsible to stop the adjoint tracking phase when:
//			-a)The adjoint track reaches the external surface.  
//			-b)The being tracked adjoint dynamic particle get an energy higher than the maximum energy of the external source.
//			-c)The adjoint track enters the volume delimited by the adjoint source.  
//		In the case a) the info (energy,weight,...) of the adjoint dynamic particle associated to the track
//			 when crossing the external source is registered and in the next event a forward primary is generated. In the other cases b) and c)
//			The next generated fwd particle is killed before being tracked and the next tracking of an adjoint particle is started directly. 	
```

## class

```cpp
  public:
    G4AdjointSteppingAction();
   ~G4AdjointSteppingAction();

    void UserSteppingAction(const G4Step*);
    
    inline void SetExtSourceEMax(G4double Emax){ext_sourceEMax=Emax;} 
    inline void SetStartEvent(G4bool aBool){start_event =aBool;}
    inline G4bool GetDidAdjParticleReachTheExtSource(){return did_adj_part_reach_ext_source;}
    inline G4ThreeVector GetLastMomentum(){return last_momentum;}
    inline G4ThreeVector GetLastPosition(){return last_pos;}
    inline G4double GetLastEkin(){return last_ekin;}
    inline G4double GetLastWeight(){return last_weight;}
    inline void SetPrimWeight(G4double weight){prim_weight=weight;} 
    inline G4ParticleDefinition* GetLastPartDef(){return last_part_def;}
    inline void SetUserAdjointSteppingAction( G4UserSteppingAction* anAction) {
    	                               theUserAdjointSteppingAction = anAction;}
    inline void SetUserForwardSteppingAction( G4UserSteppingAction* anAction) {
    	                                  theUserFwdSteppingAction = anAction;}
    inline void SetAdjointTrackingMode(G4bool aBool){is_adjoint_tracking_mode =aBool;}
    inline void ResetDidOneAdjPartReachExtSourceDuringEvent()
    						{did_one_adj_part_reach_ext_source_during_event =false;}
    inline void SetAdjointGeantinoTrackingMode(G4bool aBool){is_adjoint_geantino_tracking_mode =aBool;}
  private:

    G4double ext_sourceEMax;
    G4AdjointCrossSurfChecker* theG4AdjointCrossSurfChecker;
    G4bool start_event;
    
    G4bool did_adj_part_reach_ext_source;
    G4bool did_one_adj_part_reach_ext_source_during_event;
    G4ThreeVector last_momentum, last_pos; 
    G4double last_ekin;
    G4double last_weight ;
    G4double prim_weight ;
    G4ParticleDefinition* last_part_def;
    G4UserSteppingAction* theUserAdjointSteppingAction;
    G4UserSteppingAction* theUserFwdSteppingAction;
    G4bool is_adjoint_tracking_mode;
    G4bool is_adjoint_geantino_tracking_mode;
```


<!-- G4AdjointSteppingAction.md ends here -->
