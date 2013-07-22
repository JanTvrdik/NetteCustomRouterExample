<?php
namespace App;

use Nette;
use Nette\Application\UI;
use Twitter;


class UsersPresenter extends UI\Presenter
{
	/**
	 * @var UserManager
	 * @inject
	 */
	public $userManager;

	public function actionDefault($slug)
	{
		$user = $this->userManager->getBySlug($slug);
		if (!$user) $this->error();

		$this->params['slug'] = $user->slug;

		$this->template->user = $user;
		$this->template->tweets = $this->userManager->getTweets($user->twitter, 20);
	}

	protected function createTemplate($class = NULL)
	{
		$tpl = parent::createTemplate($class);
		$tpl->registerHelper('tweetText', 'Twitter::clickable');
		return $tpl;
	}
}
