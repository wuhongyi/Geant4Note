<!-- G4BinaryCascade.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 五 8月 10 07:16:44 2018 (+0800)
;; Last-Updated: 五 8月 10 07:17:33 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4BinaryCascade

**public G4VIntraNuclearTransportModel**



## class

```cpp
public:

  G4BinaryCascade(G4VPreCompoundModel* ptr = 0);

  virtual ~G4BinaryCascade();

  G4HadFinalState* ApplyYourself(const G4HadProjectile& aTrack,
                                              G4Nucleus& theNucleus);
  virtual G4ReactionProductVector * Propagate(G4KineticTrackVector *,
					      G4V3DNucleus *);

  virtual void ModelDescription(std::ostream&) const;
  virtual void PropagateModelDescription(std::ostream&) const;

private:

  G4BinaryCascade(const G4BinaryCascade & right);
  const G4BinaryCascade& operator=(G4BinaryCascade & right);
  G4int operator==(G4BinaryCascade& right) {return (this == &right);}
  G4int operator!=(G4BinaryCascade& right) {return (this != &right);}

// Implementation
  void PrintWelcomeMessage();
  void BuildTargetList();
  G4bool  BuildLateParticleCollisions(G4KineticTrackVector * secondaries);
  void FindCollisions(G4KineticTrackVector *);
  void FindDecayCollision(G4KineticTrack *);
  void FindLateParticleCollision(G4KineticTrack *);

//  void PropagateInit();
//  void Cascade();
  G4ReactionProductVector * DeExcite();
  G4ReactionProductVector *  DecayVoidNucleus();
  G4ReactionProductVector * ProductsAddFinalState (G4ReactionProductVector * products, G4KineticTrackVector & finalState  );
  G4ReactionProductVector * ProductsAddPrecompound(G4ReactionProductVector * products ,G4ReactionProductVector * preco );

  G4bool ApplyCollision(G4CollisionInitialState *);
  G4bool Capture(G4bool verbose=false);
  G4bool Absorb();
  G4bool CheckPauliPrinciple(G4KineticTrackVector *);
  G4double GetExcitationEnergy();
  void CorrectFinalPandE();

  G4double CorrectShortlivedPrimaryForFermi(
      G4KineticTrack* primary,G4KineticTrackVector target_collection);
  G4bool CorrectShortlivedFinalsForFermi(
        G4KineticTrackVector * products, G4double initial_Efermi);

  void UpdateTracksAndCollisions(G4KineticTrackVector * oldSecondaries,
             G4KineticTrackVector * oldTarget,
             G4KineticTrackVector * newSecondaries);
  G4bool DoTimeStep(G4double timeStep);
  G4KineticTrackVector* CorrectBarionsOnBoundary(G4KineticTrackVector *in,
                                               G4KineticTrackVector *out);
  G4Fragment * FindFragments();
  void StepParticlesOut();

  G4LorentzVector GetFinal4Momentum();
  G4LorentzVector GetFinalNucleusMomentum();

  G4ReactionProductVector * Propagate1H1(G4KineticTrackVector *,
                G4V3DNucleus *);
  G4double GetIonMass(G4int Z, G4int A);

  G4int GetTotalCharge(std::vector<G4KineticTrack *> & aV)
  {
    G4int result = 0;
    std::vector<G4KineticTrack *>::iterator i;
    for(i = aV.begin(); i != aV.end(); ++i)
    {
       result += G4lrint((*i)->GetDefinition()->GetPDGCharge());
    }
    return result;
  }
  G4int GetTotalBaryonCharge(std::vector<G4KineticTrack *> & aV)
  {
    G4int result = 0;
    std::vector<G4KineticTrack *>::iterator i;
    for(i = aV.begin(); i != aV.end(); ++i)
    {
       if ( (*i)->GetDefinition()->GetBaryonNumber() != 0 ){
             result += G4lrint((*i)->GetDefinition()->GetPDGCharge());
       }
    }
    return result;
  }

  G4ReactionProductVector * HighEnergyModelFSProducts(G4ReactionProductVector *,
		  	  	  	 G4KineticTrackVector * secondaries);                                // add secondaries of string model to G4RPV
  G4ReactionProductVector * FillVoidNucleusProducts(G4ReactionProductVector * );    // nucleus destroyed, add secondaries to G4RPV
// utility methods

  G4ThreeVector GetSpherePoint(G4double r, const G4LorentzVector & momentumdirection);

  void ClearAndDestroy(G4KineticTrackVector * ktv);
  void ClearAndDestroy(G4ReactionProductVector * rpv);

// for debugging purpose

  G4ReactionProductVector * ProductsAddFakeGamma(G4ReactionProductVector * products );

  void PrintKTVector(G4KineticTrackVector * ktv, std::string comment=std::string(""));
  void PrintKTVector(G4KineticTrack* kt, std::string comment=std::string(""));
  void DebugApplyCollisionFail(G4CollisionInitialState * collision,
		  	  	  	  	   G4KineticTrackVector * products);
  void DebugApplyCollision(G4CollisionInitialState * collision,
                           G4KineticTrackVector *products);
  G4bool DebugFinalEpConservation(const G4HadProjectile & aTrack, G4ReactionProductVector* products);
  G4bool DebugEpConservation(const G4String where);
  G4bool CheckChargeAndBaryonNumber(G4String where);

private:
  G4KineticTrackVector theProjectileList;	// replaced by theProjectile4Momentum
  G4KineticTrackVector theTargetList;		// list of nucleons in Nucleus
  G4KineticTrackVector theSecondaryList;	// particles being followed
  G4KineticTrackVector theCapturedList;		// captured particles
  G4KineticTrackVector theFinalState;		// particles for final state


  G4ExcitationHandler * theExcitationHandler;
  G4CollisionManager * theCollisionMgr;

  G4Scatterer * theH1Scatterer;

  std::vector<G4BCAction *> theImR;
  G4BCDecay * theDecay;
  G4BCLateParticle * theLateParticle;
  G4VFieldPropagation * thePropagator;
  G4DecayKineticTracks decayKTV;

  G4double theCurrentTime;
  G4double theBCminP;
  G4double theCutOnP;
  G4double theCutOnPAbsorb;
  G4LorentzVector theInitial4Mom;   // suppress?
  G4LorentzVector theProjectile4Momentum;
  G4int currentA, currentZ, lateA, lateZ;
  G4int initialZ, initialA,projectileA,projectileZ;
  G4double massInNucleus, initial_nuclear_mass;
  G4double currentInitialEnergy;   // for debugging
  G4LorentzRotation precompoundLorentzboost;
  G4double theOuterRadius;
  G4bool thePrimaryEscape;
  const G4ParticleDefinition * thePrimaryType;
  G4ThreeVector theMomentumTransfer;
  static G4int theBIC_ID;
#ifdef G4MULTITHREADED
  static G4Mutex BICMutex;
#endif
```

<!-- G4BinaryCascade.md ends here -->
