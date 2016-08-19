package controllers

import javax.inject.{Inject, Singleton}

import play.api.mvc.{Action, Controller}

@Singleton
class Hello @Inject() extends Controller {
  def index = Action { implicit request =>
    Ok(views.html.index())
  }
}
