FROM continuumio/miniconda3
ADD requirements.txt /app/
RUN apt update \
	&& apt upgrade -y \
	&& pip install --upgrade pip \
	&& pip install -r /app/requirements.txt \
	&& conda update -y conda \
	&& conda install scikit-learn 
	#&& conda install basemap plotly plotly_express

CMD cd /home &&  /opt/conda/bin/jupyter notebook --port=8887 --no-browser --ip=0.0.0.0 --allow-root
