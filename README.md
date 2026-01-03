# Dynamic pH Process Simulator and Feedback Control

A complete dynamic modeling and control framework for a nonlinear pH neutralization process, including simulator development, steady-state and dynamic validation, and closed-loop pH control under realistic disturbances.

This repository contains Simulink models developed as part of the **Chemical Engineering Club Hackathon 2025**, where the objective was to reproduce the pH process simulator proposed by Choi et al. (1995) and design a feedback controller for pH regulation.

---

<pre>
pH-Process-Simulator/
│── WATER_TASK1_MAIN.slx        # Dynamic pH process simulator (model development)
│── WATER_TASK2_MAIN.slx        # Steady-state & dynamic validation
│── WATER_TASK3_MAIN.slx        # Feedback controller design & closed-loop simulations
│── Water-CH23B008.pptx         # Hackathon presentation (results & discussion)
│── Hackathon_Challenge.pdf     # Problem statement & evaluation criteria
│── README.md                   # Documentation
</pre>

---

## Project Objectives

- Develop a **dynamic pH neutralization process simulator** for a continuous stirred-tank reactor (CSTR)
- Validate the simulator against **published steady-state and dynamic results**
- Incorporate **non-idealities** such as:
  - Dead-zone mixing
  - Sensor lag
  - Measurement noise
  - Autoregressive drift
- Design a **feedback controller** to regulate pH under step and ramp disturbances

---

## pH Process Simulator

### Process Modeling

- Continuous stirred-tank neutralization process
- Non-ideal mixing modeled using **active zone + dead zone**
- Dynamic mass balances on all species
- Instantaneous acid–base equilibrium assumption
- Water dissociation included

### Electrochemical Equilibrium

- Strong and weak acids/bases
- Multi-component ionic equilibrium
- pH computed via nonlinear equilibrium relations
- Numerical solution using iterative root-finding

---

## Simulation of Realistic Effects

### Mixing Dynamics

- Inter-zone mass transfer between active and dead zones
- Captures slow concentration dynamics and non-ideal behavior

### Sensor Dynamics

- First-order sensor lag applied to true pH
- Models realistic pH probe response delay

### Noise and Drift

- Gaussian measurement noise
- Autoregressive drift to simulate sensor calibration and upstream disturbances

---

## Model Validation

### Steady-State Validation

- Reproduced published titration curves from literature
- Verified equilibrium behavior against reported results

### Dynamic Validation

- Reproduced dynamic step and ramp responses
- Generated three trends:
  - Deterministic process output
  - Output with sensor lag
  - Output with sensor lag, noise, and drift

---

## Feedback Controller Design

- PID-based feedback control
- Process variable: **measured pH**
- Manipulated variable: **reagent flow rate**
- Controller designed and tested under:
  - Step disturbances
  - Ramp disturbances
  - Nonstationary influent conditions

### Performance Evaluation

- Closed-loop pH regulation
- Disturbance rejection analysis
- Comparison of controlled vs uncontrolled behavior

---

## How to Run

1. Open MATLAB with Simulink
2. Load any of the following files:
   - `WATER_TASK1_MAIN.slx`
   - `WATER_TASK2_MAIN.slx`
   - `WATER_TASK3_MAIN.slx`
3. Click **Run**
4. No user inputs required — default parameters are set as per literature

---

## Outcome

- **1st Prize – Chemical Engineering Club Hackathon 2025**
- Evaluated on:
  - Model accuracy
  - Validation fidelity
  - Realism of disturbances
  - Effectiveness of control strategy

---

## Reference

Choi, J. Y., Pandit, H. G., Rhinehart, R. R., & Farrell, R. J. (1995).  
*A process simulator for pH control studies.*  
Computers & Chemical Engineering, 19(5), 527–539.
