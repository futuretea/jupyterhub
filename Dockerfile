FROM jupyterhub/jupyterhub:1.0.0
RUN useradd note
RUN echo "c.JupyterHub.admin_access = True">/srv/jupyterhub/jupyterhub_config.py
RUN echo "c.Authenticator.admin_users = {'note'}">>/srv/jupyterhub/jupyterhub_config.py
