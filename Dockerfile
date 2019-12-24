FROM jupyterhub/jupyterhub:1.0.0
RUN apt update -y && chmod -R 777 /home
RUN pip install notebook jupyter_contrib_nbextensions widgetsnbextension
RUN jupyter contrib nbextension install --user
RUN pip install ipyparallel && ipcluster nbextension enable
RUN npm install -g cnpm --registry=https://registry.npm.taobao.org \
    && sudo npm install -g ijavascript \
    && ijsinstall
RUN useradd admin
RUN echo "admin:admin" | chpasswd
RUN echo "c.JupyterHub.admin_access = True">/srv/jupyterhub/jupyterhub_config.py \
    &&  echo "c.Authenticator.admin_users = {'admin'}">>/srv/jupyterhub/jupyterhub_config.py
