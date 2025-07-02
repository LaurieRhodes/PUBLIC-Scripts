# Azure Machine Learning with Azure Data Explorer: Room Occupancy Prediction

A comprehensive tutorial demonstrating end-to-end machine learning workflows using Azure Machine Learning (AML) and Azure Data Explorer (ADX) for binary classification of room occupancy.

## 🎯 Overview

This notebook showcases a complete production-ready ML pipeline that integrates two powerful Azure services:

- **Azure Data Explorer (ADX)**: Efficient time-series data storage, querying, and real-time ML inference
- **Azure Machine Learning**: Managed model training, evaluation, and deployment

### Business Applications

Room occupancy prediction is valuable for:

- **Smart Building Management**: HVAC optimization for energy efficiency
- **Space Utilization Analytics**: Understanding building usage patterns  
- **Security Systems**: Anomaly detection and unauthorized access monitoring
- **IoT Data Processing**: Scalable sensor data analytics

## 📊 Dataset

The tutorial uses example environmental sensor data from an office space containing:

| Feature       | Description                        | Type            |
| ------------- | ---------------------------------- | --------------- |
| Temperature   | Room temperature (°C)              | Numeric         |
| Humidity      | Relative humidity (%)              | Numeric         |
| Light         | Illumination levels (Lux)          | Numeric         |
| CO2           | Carbon dioxide concentration (ppm) | Numeric         |
| HumidityRatio | Derived humidity metric            | Numeric         |
| Occupancy     | Room occupied (True/False)         | Target Variable |



## 🏗️ Architecture

```
[Sensor Data] → [Azure Data Explorer] → [Azure ML Training] → [Model Deployment] → [Real-time Inference in ADX]
```

The pipeline demonstrates:

1. **Data ingestion** into ADX with proper schema design
2. **Data export** to Azure Blob Storage for ML training
3. **Model training** on Azure ML compute clusters
4. **Model storage** back in ADX for inference
5. **Real-time scoring** using ADX's Python capabilities

## 🚀 Getting Started

### Prerequisites

#### Azure Data Explorer Requirements

- ADX cluster with **Python plugin enabled** (required for model inference)
- Database with appropriate permissions
- Sample dataset loaded (instructions included in notebook)

#### Azure Machine Learning Requirements

- Azure ML workspace
- Azure Storage account with blob container
- Compute cluster (auto-created if needed)

#### Python Environment

- Python 3.9+ 
- Required packages (auto-installed in notebook):
  - `azureml-core`
  - `Kqlmagic`
  - `azure-storage-blob`
  - `scikit-learn`
  - `pandas`

## 🔧 Key Features

### Modern Azure ML Integration

- Uses **ScriptRunConfig** (current best practice) instead of deprecated Estimators
- Automatic environment management with conda dependencies
- Comprehensive error handling and progress monitoring

### Advanced Data Pipeline

- Seamless data export from ADX to Azure Blob Storage
- Automated train/test split validation
- Cross-validation with dynamic fold calculation for small datasets

### Multiple ML Algorithms

Compares performance across four classification approaches:

- **Decision Tree Classifier**
- **Logistic Regression** 
- **K-Nearest Neighbors**
- **Gaussian Naive Bayes**

### Production-Ready Deployment

- Model serialization and storage in ADX tables
- Real-time inference using ADX's Python capabilities
- Scalable scoring with KQL integration

## 📈 Expected Results

The notebook typically achieves:

- **Training accuracy**: 95-99% across models
- **Model training time**: 2-5 minutes on standard compute
- **End-to-end pipeline**: ~15 minutes for complete workflow

Performance varies by algorithm:

- **Decision Tree**: Often highest accuracy, fast training
- **Logistic Regression**: Good balance of performance and interpretability
- **K-NN**: Simple but effective for this dataset size
- **Naive Bayes**: Fastest training, reasonable accuracy

## 🔗 Additional Resources

- [Azure Data Explorer Documentation](https://docs.microsoft.com/azure/data-explorer/)
- [Azure Machine Learning Documentation](https://docs.microsoft.com/azure/machine-learning/)
- [KQL Query Language Reference](https://docs.microsoft.com/azure/data-explorer/kusto/query/)
- [Azure ML Python SDK Guide](https://docs.microsoft.com/python/api/overview/azure/ml/)

## 📄 License

This project is provided as educational material. Original example adapted from [Mohammad Ghodratigohar's tutorial](https://www.youtube.com/watch?v=wtCQ7vI9_60).

## 
