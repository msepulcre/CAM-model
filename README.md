# Empirical Models for the Realistic Generation of Cooperative Awareness Messages in Vehicular Networks
This repository includes the data for the models presented in the following article:

    Rafael Molina-Masegosa, Miguel Sepulcre, Javier Gozalvez, Friedbert Berens, Vincent Martinez
    "Empirical Models for the Realistic Generation of Cooperative Awareness Messages in Vehicular Networks", 
    Submitted to IEEE Transactions on Vehicular Technology (in reviewing process, to be updated)

In order to comply with our sponsor guidelines, we would appreciate if any publication using this data references the above-mentioned publication.

Folder M_matrix includes the M matrix with the transition probabilities for the Markov chain models.
In total there are 24 models including:

	- Renault and Volkswagen traces.
	- Highwat, suburban, urban and universal scenario.
	- Complete model, separate CAM time-intervals model and separate CAM sizes model.

Folder PDF includes the PDF extracted from real traces, necessary to generate the first trace when using the models. For complete models, the joint size and time-interval PDF is provided, while CAM time-interval PDF and CAM size PDFs are provided for separate time-intervals models and separate sizes models respectively.

The script 'traces_generation_example.m' provides an example of how to generate an arbitrary number of traces using each of the models.
