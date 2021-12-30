ARG BASE_CONTAINER=jupyter/pyspark-notebook:2c0af4ab516b
FROM $BASE_CONTAINER

LABEL DS - BASE (Marcos e Marcus)  

ARG PARAM_UID=8500
ARG PARAM_GID=8500


USER root
RUN apt-get -qq update && apt-get install -y --no-install-recommends apt-utils openssh-client

RUN /usr/local/spark/bin/spark-shell --packages com.databricks:spark-xml_2.11:0.10.0
RUN cp /root/.ivy2/jars/com.databricks_spark-xml_2.11-0.10.0.jar /usr/local/spark/jars/com.databricks_spark-xml_2.11-0.10.0.jar

# Creating user with same UID and GUID
RUN groupadd -g "${PARAM_GID}" ds_base; \
  adduser --disabled-password --uid "${PARAM_UID}" --gid "${PARAM_GID}" --gecos ds_base ds_base && \
  groupadd -r supersudo && \
  echo "%supersudo ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/supersudo && \
  usermod -a -G supersudo,users ds_base

RUN cp -v -rf /home/$NB_USER/. /home/ds_base/
RUN chown -R ds_base:ds_base /home/ds_base

USER ds_base
ENV HOME /home/ds_base

# USER $NB_UID
WORKDIR /opt/mentoria_ds_base/

RUN python -m pip install --upgrade --force-reinstall --ignore-installed pip
ADD requirements.txt .
RUN pip install -q -r requirements.txt
RUN pip install -q pytest pytest-cov

RUN echo 'c.NotebookApp.contents_manager_class = "notedown.NotedownContentsManager"' >> ~/.jupyter/jupyter_notebook_config.py

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8