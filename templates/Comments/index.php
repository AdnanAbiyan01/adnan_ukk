<?php
/**
 * @var \App\View\AppView $this
 * @var \App\Model\Entity\Comment[]|\Cake\Collection\CollectionInterface $comments
 */
?>

<?php
$this->assign('title', __('Comments'));
$this->Breadcrumbs->add([
    ['title' => __('Home'), 'url' => '/'],
    ['title' => __('List Comments')],
]);
?>

<div class="card card-primary card-outline">
    <div class="card-header d-flex flex-column flex-md-row">
        <h2 class="card-title">
            <!-- -->
        </h2>
        <div class="d-flex ml-auto">
            <?= $this->Paginator->limitControl([], null, [
                'label' => false,
                'class' => 'form-control form-control-sm',
                'templates' => ['inputContainer' => '{{content}}']
            ]); ?>
            <?= $this->Html->link(__('New Comment'), ['action' => 'add'], ['class' => 'btn btn-primary btn-sm ml-2']) ?>
        </div>
    </div>
    <!-- /.card-header -->
    <div class="card-body table-responsive p-0">
        <table class="table table-hover text-nowrap">
            <thead>
                <tr>
                    <th><?= $this->Paginator->sort('id') ?></th>
                    <th><?= $this->Paginator->sort('user_id') ?></th>
                    <th><?= $this->Paginator->sort('date') ?></th>
                    <th><?= $this->Paginator->sort('photo_id') ?></th>
                    <th class="actions"><?= __('Actions') ?></th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($comments as $id => $comment) : ?>
                    <tr>
                        <td><?= $this->Number->format($id + 1) ?></td>
                        <td><?= $comment->has('user') ? $this->Html->link($comment->user->name, ['controller' => 'Users', 'action' => 'view', $comment->user->id]) : '' ?></td>
                        <td><?= h($comment->date) ?></td>
                        <td><?= $comment->has('photo') ? $this->Html->link($comment->photo->title, ['controller' => 'Photos', 'action' => 'view', $comment->photo->id]) : '' ?></td>
                        <td class="actions">
                            <?= $this->Html->link(__('View'), ['action' => 'view', $comment->id], ['class' => 'btn btn-xs btn-outline-primary', 'escape' => false]) ?>
                            <?= $this->Html->link(__('Edit'), ['action' => 'edit', $comment->id], ['class' => 'btn btn-xs btn-outline-primary', 'escape' => false]) ?>
                            <?= $this->Form->postLink(__('Delete'), ['action' => 'delete', $comment->id], ['class' => 'btn btn-xs btn-outline-danger', 'escape' => false, 'confirm' => __('Are you sure you want to delete # {0}?', $comment->id)]) ?>
                        </td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>
    <!-- /.card-body -->
    <div class="card-footer d-flex flex-column flex-md-row">
        <div class="text-muted">
            <?= $this->Paginator->counter(__('Page {{page}} of {{pages}}, showing {{current}} record(s) out of {{count}} total')) ?>
        </div>
        <ul class="pagination pagination-sm mb-0 ml-auto">
            <?= $this->Paginator->first('<i class="fas fa-angle-double-left"></i>', ['escape' => false]) ?>
            <?= $this->Paginator->prev('<i class="fas fa-angle-left"></i>', ['escape' => false]) ?>
            <?= $this->Paginator->numbers() ?>
            <?= $this->Paginator->next('<i class="fas fa-angle-right"></i>', ['escape' => false]) ?>
            <?= $this->Paginator->last('<i class="fas fa-angle-double-right"></i>', ['escape' => false]) ?>
        </ul>
    </div>
    <!-- /.card-footer -->
</div>